package Vista;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.mysql.cj.protocol.Resultset;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JPasswordField;
import javax.swing.JButton;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.awt.event.ActionEvent;

public class Login extends JFrame {

	private JPanel contentPane;
	private JPasswordField passwordField;

	/**
	 * Launch the application.
	 */
	
	private String login = "root";
	private String pwd = "";
	private String url = "jdbc:mysql://localhost/aplicacionswing?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static Connection conexion;

	public void TestConection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url, login, pwd);
			// Quitamos esta instrucci�n: conexion.close();
			// System.out.println (" - Conexi�n con MySQL establecida -");
		} catch (Exception e) {
			// System.out.println (" � Error de Conexi�n con MySQL -");
			e.printStackTrace();
		}
	}
	void ingresar(String usuario, String password) {
		String captura ="";
		String sql="SELECT * FROM login WHERE usuario = '"+usuario+"'&&password='"+password+"'";
		try {
			Statement st =conexion.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				captura = rs.getString("rol");
				if(captura.equals("Profesor")) {
					JOptionPane.showMessageDialog(rootPane, "Bienvenido profesor");
				}
				if(captura.equals("Alumno")) {
					JOptionPane.showMessageDialog(rootPane, "Por favor rellene el test");
				}
				if(!captura.equals("Profesor")&&!captura.equals("Alumno")) {
					JOptionPane.showMessageDialog(rootPane, "El usuario no existe");
				}
				if(captura.isEmpty()) {
					JOptionPane.showMessageDialog(rootPane, "El campo Usuario esta vacio");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Login frame = new Login();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Login() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 514, 204);
		contentPane = new JPanel();
		contentPane.setBackground(Color.CYAN);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblLogin = new JLabel("LOGIN");
		lblLogin.setBounds(207, 12, 55, 14);
		contentPane.add(lblLogin);
		
		JLabel lblusuario = new JLabel("Usuario");
		lblusuario.setBounds(12, 72, 55, 14);
		contentPane.add(lblusuario);
		
		JLabel lbpass = new JLabel("Password");
		lbpass.setBounds(12, 119, 66, 14);
		contentPane.add(lbpass);
		
		JTextArea textusuario = new JTextArea();
		textusuario.setBounds(101, 72, 99, 14);
		contentPane.add(textusuario);
		
		passwordField = new JPasswordField();
		passwordField.setBounds(101, 117, 99, 18);
		contentPane.add(passwordField);
		
		JButton btnLogearse = new JButton("Logearse");
		btnLogearse.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String usuario=textusuario.getText();
				String password = new String(passwordField.getPassword());
				ingresar(usuario, password);
			}
		});
		btnLogearse.setBounds(349, 88, 98, 24);
		contentPane.add(btnLogearse);
	}
}
