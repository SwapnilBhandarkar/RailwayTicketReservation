import java.io.File;
import java.io.FileWriter;
import java.io.FileReader;
import java.util.Scanner;
import java.sql.CallableStatement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 class Railways1{
    public static void main(String[] args)throws Exception {
        Train1 t = new Train1();
        Ticket_Booking tb = new Ticket_Booking();
        // Registration1 r = new Registration1();
        Scanner sc= new Scanner(System.in);
        int choice;
        
         String driverName = "com.mysql.cj.jdbc.Driver";
            Class.forName(driverName);
            System.out.println("Welcome");  
            String dburl = "jdbc:mysql://localhost:3306/swap1";
            String dbuser = "root";
            String dbpass = "";
            Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
        Series r = new Series();
         if(con!=null)
        {
            System.out.println("Connection Successfull");
            String name  = "";
            String password = "";
            do{
                
                System.out.println("Welcome to Railway's Reservation Website");
                System.out.println("1. For Registration");
                System.out.println("2. Log In via email account");
                System.out.println("3. To Sign Out from Your Account");// make package of loc 15 to 20 (after not yet)
                System.out.println("4. For Inserting Train Info");
                System.out.println("5. To Delete Train Record [please go to 7 first]");
                System.out.println("6. To Update Train Record [please go to 7 first]");
                System.out.println("7. To Display Available Trains");
                System.out.println("8. To Search Perticular Train");
                System.out.println("9. To Exit");
                
                
                    System.out.println("Enter Choice");
                //  sc.nextLine();
                 choice = sc.nextInt();
                
                

                if(choice ==2)
                {
                    System.out.println("Enter email address");
                    name = sc.next();
                    System.out.println("Enter Password");
                    password = sc.next();
                }
                switch(choice)
                {
                    case 1 :
                    r.add1(con);
                    System.out.println("Thank you For Registration");
                    //more work on progress
                    break;
                    case 2 : 
                    tb.checking(con, name, password);//checks password
                    //work in progress
                    break;
                    case 3 :
                    r.remove(con);
                    System.out.println("Thank you for your visit");
                    break;
                    case 4 :
                    t.insertion(con);
                    break;
                    case 5 :
                    t.remove(con);
                    break;
                    case 6 :
                    t.update(con);
                    break;
                    case 7 :
                    t.display(con);
                    break;
                    case 8 :
                    t.search_Train(con);
                    break;
                    case 9 :
                    System.out.println("Thank for your Visit");
                    break;
                    default :
                    System.out.println("Enter Valid Choice");
                    break;
                }
        }while(choice!=9);
    }       
    else{
            System.out.println("Connection Failed");
            System.exit(0);
        }
        // con.close();
        
    }
}
class Series
{
    int age;
    String email="";
    String password="";
    void add1(Connection con) throws Exception
    {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Name of customer");
        String name = sc.nextLine();
        try{
        System.out.println("Enter Age");
         age = sc.nextInt();
        }
     catch(Exception e)
       {
         System.out.print("\u001B[31mPlease enter integer value\n");
        System.out.print("\u001B[0m");
        System.out.println();
            add1(con);
       }
        sc.nextLine();
        System.out.println("Enter Email Account");
         email = sc.next();
        System.out.println("Enter Password ");
         password = sc.next();
        String sql = "{call insertion(?,?,?,?) }";
        CallableStatement pst = con.prepareCall(sql);
        pst.setString(1,name);
        pst.setInt(2,age);
        pst.setString(3,email);
        pst.setString(4,password);
        pst.executeUpdate();
        // sc.close();
    }
    
    void remove(Connection con) throws Exception //signout from database
    {
        int id;
        Scanner sc = new Scanner(System.in);
       String sql  ="delete from customer where Id = ?";
       CallableStatement cst = con.prepareCall(sql);
        try{
        System.out.println("Enter ID");
          id = sc.nextInt();
        }
     catch(Exception e)
       {
         System.out.print("\u001B[31mPlease enter integer value\n");
        System.out.print("\u001B[0m");
        System.out.println();
            remove(con);
       }
       cst.executeUpdate();
    //    sc.close();
    }
}
class Train1
{
    Scanner sc = new Scanner(System.in);

    void insertion(Connection con) throws Exception //add exeception
    {
        String sql = "insert into trains values(?,?,?,?,?,?,?,?,?,?,?,?)" ;
        CallableStatement cst = con.prepareCall(sql);
        try{
                 System.out.println("Enter PNR No. of Train");
                    int pnr = sc.nextInt();
                     cst.setInt(1,pnr);
                }
              catch(Exception e)
             {
               System.out.print("\u001B[31mPlease enter integer value");
               System.out.print("\u001B[0m");
               System.out.println();
                insertion(con);
             }
        System.out.println("Enter Name of train");
        String name = sc.next();
        cst.setString(2,name);
        System.out.println("Enter Starting Point ");
        System.out.println(" Ahmedabad (AHM)    Mumbai (BOM)");
        System.out.println(" Delhi (DEL)  Kolkata (KOL)");
        String departure = sc.next().toUpperCase();
        cst.setString(3,departure);
        System.out.println("Enter Destination");
        System.out.println(" Ahmedabad (AHM)    Mumbai (BOM)");
        System.out.println(" Delhi (DEL)  Kolkata (KOL)");
        String destination = sc.next().toUpperCase();
        cst.setString(4,destination);
        System.out.println("Enter Number of ticket's For 1st Class");
        int ticket = sc.nextInt(); 
        cst.setInt(5,ticket);
        System.out.println("Enter Number of ticket's For 2nd Class");
        int ticket1 = sc.nextInt(); 
        cst.setInt(6,ticket1);
        System.out.println("Enter Number of ticket's For 3rd Class");
        int ticket2 = sc.nextInt(); 
        cst.setInt(7,ticket2);
        System.out.println("Enter Number of ticket's For Local Class");
        int ticket3 = sc.nextInt(); 
        cst.setInt(8,ticket3);
        System.out.println("Enter price of 1st class");
        int price = sc.nextInt();
        cst.setInt(9,price);
         System.out.println("Enter price of 2nd class");
        int price1 = sc.nextInt();
        cst.setInt(10,price1);
         System.out.println("Enter price of 3rd class");
        int price2 = sc.nextInt();
        cst.setInt(11,price2);
         System.out.println("Enter price of local class");
        int price3 = sc.nextInt();
        cst.setInt(12,price3);
        cst.executeUpdate();
        System.out.println("Visit again");
}   
    void remove(Connection con) throws Exception
    {
            String sql = "{call deletedata(?)}";
            CallableStatement cst = con.prepareCall(sql);
            System.out.println("To remove train ");
             try{
                 System.out.println("Enter PNR No. of Train");
                    int pnr = sc.nextInt();
                     cst.setInt(1,pnr);
                }
              catch(Exception e)
             {
               System.out.print("\u001B[31mPlease enter integer value");
               System.out.print("\u001B[0m");
               System.out.println();
                remove(con);
             }
            
           
            cst.executeUpdate();   
    }
    void update(Connection con) throws Exception
    { 
            String sql = "update trains set Starting_point = ?,Destination = ? where PNR = ?";
            CallableStatement cst = con.prepareCall(sql);
            System.out.println("To Update train information ");
            try{
                 System.out.println("Enter PNR No. of Train");
                    int pnr = sc.nextInt();
                     cst.setInt(3,pnr);
                }
              catch(Exception e)
             {
               System.out.print("\u001B[31mPlease enter integer value");
               System.out.print("\u001B[0m");
               System.out.println();
                update(con);
             }
            // cst.setInt(3,pnr);
            System.out.println("Enter Starting Point ");
            System.out.println(" Ahmedabad (AHM)    Mumbai (BOM)");
            System.out.println(" Delhi (DEL)  Kolkata (KOL)");
            String departure = sc.next();
            if(departure.equalsIgnoreCase("AHM")||departure.equalsIgnoreCase("DEL")||departure.equalsIgnoreCase("BOM")||departure.equalsIgnoreCase("KOL"))
            {
                cst.setString(1,departure);
            }
            else
            {
                System.out.println("Enter Valid departure Location");
            }
            System.out.println("Enter Destination");
            System.out.println(" Ahmedabad (AHM)    Mumbai (BOM)");
            System.out.println(" Delhi (DEL)  Kolkata (KOL)");
            String destination = sc.next();
            if(destination.equalsIgnoreCase("AHM")||destination.equalsIgnoreCase("DEL")||destination.equalsIgnoreCase("BOM")||destination.equalsIgnoreCase("KOL"))
            {
                cst.setString(2,destination);
            }
            else
            {
                System.out.println("Enter Valid destination Location");
            }
            cst.executeUpdate();
    }
    void display(Connection con) throws Exception
    {

            String sql  = "{ call displaydata() }";
            CallableStatement cst = con.prepareCall(sql);
            ResultSet rs = cst.executeQuery();
            while(rs.next())
            {
                System.out.println("PNR : "+rs.getInt("PNR"));
                System.out.println("Name of train : "+rs.getString("Name of Train"));
                System.out.println("Starting point : "+rs.getString("Starting_point"));
                System.out.println("Destination : "+rs.getString("Destination"));
                System.out.println("Tickets For 1st class: "+rs.getInt("Ticket_1"));
                System.out.println("Price For 1st class: "+rs.getInt("price_1"));  
                System.out.println("Tickets For 2nd class: "+rs.getInt("Ticket_2"));
                System.out.println("Price For 2nd class: "+rs.getInt("price_2"));  
                System.out.println("Tickets For 3rd class: "+rs.getInt("Ticket_3"));
                System.out.println("Price For 3rd class: "+rs.getInt("price_3"));  
                System.out.println("Tickets For local class: "+rs.getInt("Ticket_l"));
                System.out.println("Price For local class: "+rs.getInt("price_l"));  
                System.out.println("..............................................................");
            } 
            cst.executeUpdate();
    }
    void search_Train(Connection con) throws Exception
    {
            
            String sql  = "{ call displayPNR(?) }";
            CallableStatement cst = con.prepareCall(sql);
            try{
                 System.out.println("Enter PNR No. of Train");
                     int pnr = sc.nextInt();
                     cst.setInt(1,pnr);
                }
              catch(Exception e)
             {
               System.out.print("\u001B[31mPlease enter integer value");
               System.out.print("\u001B[0m");
               System.out.println();
                search_Train(con);
             }
             int flag=0;
            ResultSet rs = cst.executeQuery();
            while(rs.next())
            {
                System.out.println("PNR : "+rs.getInt("PNR"));
                System.out.println("Name of train : "+rs.getString("Name of Train"));
                System.out.println("Starting point : "+rs.getString("Starting_point"));
                System.out.println("Destination : "+rs.getString("Destination"));
                System.out.println("Tickets For 1st class: "+rs.getInt("Ticket_1"));
                System.out.println("Price For 1st class: "+rs.getInt("price_1"));  
                System.out.println("Tickets For 2nd class: "+rs.getInt("Ticket_2"));
                System.out.println("Price For 2nd class: "+rs.getInt("price_2"));  
                System.out.println("Tickets For 3rd class: "+rs.getInt("Ticket_3"));
                System.out.println("Price For 3rd class: "+rs.getInt("price_3"));  
                System.out.println("Tickets For local class: "+rs.getInt("Ticket_l"));
                System.out.println("Price For local class: "+rs.getInt("price_l"));
                flag++;
            }  
            if(flag==0)
            {
                // System.out.println();
                System.out.print("\u001B[31mPlease enter valid pnr value");
               System.out.print("\u001B[0m");
            }
    }
}

class Ticket_Booking 
{
    Train1 t = new Train1();
    
    Scanner sc= new Scanner(System.in);
    void checking(Connection con,String email,String password) throws Exception
    {
       
        File f = new File("invoice.txt");
        FileWriter fw = new FileWriter(f);
        FileReader fr = new FileReader(f);
        String sql = "select * from customer ";
        PreparedStatement cst = con.prepareStatement(sql);
        Boolean flag = false;
        ResultSet rs = cst.executeQuery(sql);
        String name = "";
        int age = 0;
        while(rs.next())
        {
           if(rs.getString("Email").equals(email) && rs.getString("Password").equals(password))
           {
               name = rs.getString("Name");
               age = rs.getInt("Age");
               System.out.println("Welcome!!!");
               flag = true;
               break;
           }
        }
         cst.execute();
         if(flag)
         {
            System.out.println("Do you want to display trains Info.");
            System.out.println("For that press 1. 'YES'    2. 'NO' ");
            int choice = sc.nextInt();
            if(choice ==1)
                 {
                     t.display(con);
                 }
             String sql1 = "select * from trains where PNR = ?";
             CallableStatement cst1 = con.prepareCall(sql1);
           
                
                int pnr=0 ;
                try
                {
                    System.out.println("Enter Train PNR number");
                    pnr = sc.nextInt(); 
                    cst1.setInt(1,pnr);
                }
                catch(Exception e )
                {
                    System.out.println("\u001B[31mPlease Enter Valid PNR number\u001B[37m");
                    System.out.println();
                    checking(con, email, password);
                 }
               
            System.out.println("Enter Class of train ");
            System.out.println("Classes available 1.1st class 2. 2nd Class 3. 3rd class 4. Local class");
            int count = sc.nextInt();
            ResultSet rs1 = cst1.executeQuery();
                
           int ticket = 0;
           int price = 0;
           String s1 = "";
           String s2 = "";
           String s3 = "";
           while(rs1.next())
           {
                System.out.println("Name of Train : "+rs1.getString("Name of Train"));
                s1 = rs1.getString("Name of Train");
                System.out.println("Start From : "+rs1.getString("Starting_point"));
                s2 = rs1.getString("Starting_point");
                System.out.println("Destination : "+rs1.getString("Destination"));
                s3 = rs1.getString("Destination");
                if(count==1)
                    {
                        System.out.println("Tickets Available : "+rs1.getInt("Ticket_1"));
                        ticket = rs1.getInt("Ticket_1");
                        System.out.println("Price of each : "+rs1.getInt("price_1"));
                        price = rs1.getInt("price_1");
                    }
            else if(count==2)
            {
               System.out.println("Tickets Available : "+rs1.getInt("Ticket_2"));
                ticket =  rs1.getInt("Ticket_2");
                System.out.println("Price of each : "+rs1.getInt("price_2"));
                price = rs1.getInt("price_2"); 
            }
            else if(count==3)
            {
                System.out.println("Tickets Available : "+rs1.getInt("Ticket_3"));
                ticket =  rs1.getInt("Ticket_3");
                System.out.println("Price of each : "+rs1.getInt("price_3"));
                price = rs1.getInt("price_3");
            }
            else if(count==4)
            {
                System.out.println("Tickets Available : "+rs1.getInt("Ticket_l"));
                ticket =  rs1.getInt("Ticket_l");
                System.out.println("Price of each : "+rs1.getInt("price_l"));
                price = rs1.getInt("price_l");
            }
           }
             cst1.execute();
        
             System.out.println("Enter Number of Tickets you Want");
             int ticket2 = sc.nextInt();
            if(ticket2>ticket)
            {
                System.out.println("Seats Are Not Available");
            }
            else
            {
                updateTicket(con, ticket-ticket2, pnr,count); 
                fw.write("Name : "+name);
                fw.write("\n");
                fw.write("Age : "+age);
                fw.write("\n");
                fw.write("Email : "+email);
                fw.write("\n");
                fw.write("PNR : "+pnr);
                fw.write("\n");
                fw.write("Train Name : "+s1);
                fw.write("\n");
                fw.write("Starting From : "+s2);
                fw.write("\n");
                fw.write("Destination : "+s3);
                fw.write("\n");
                if(count==1)
                {
                fw.write("1st class");
                fw.write("\n");
                }
                else if(count==2)
                {
                fw.write("2nd class");
                fw.write("\n");
                }
                else if(count==3)
                {
                fw.write("3rd class");
                fw.write("\n");
                }
                else if(count==4)
                {
                fw.write("local class");
                fw.write("\n");
                }
                
                 fw.write("Ticket_No.");
                fw.write("\n");
                for(int i = ticket;i>ticket-ticket2;i--)
                {
                    fw.write(i+" ");
                }
                fw.write("\n");
                int sum = price*ticket2;
                fw.write("Price : "+sum);
                fw.write("\n");
                fw.close();
                fr.close();
                invoice(con,email);
            }
            }
        }
        void updateTicket(Connection con,int ticket,int pnr,int count) throws Exception
    {

        if(count==1)
        {
        String sql = "update trains set Ticket_1 = ? where PNR = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1,ticket);
        pst.setInt(2,pnr);
        pst.executeUpdate();
        }
        else if(count==2)
        {
        String sql = "update trains set Ticket_2 = ? where PNR = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1,ticket);
        pst.setInt(2,pnr);
        pst.executeUpdate();
        }
        else if(count==3)
        {
        String sql = "update trains set Ticket_3 = ? where PNR = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1,ticket);
        pst.setInt(2,pnr);
        pst.executeUpdate();
        }
        else if(count==4)
        {
        String sql = "update trains set Ticket_l = ? where PNR = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1,ticket);
        pst.setInt(2,pnr);
        pst.executeUpdate();
        } 
    }
    void invoice(Connection con,String email) throws Exception
    {
        File f = new File("invoice.txt");
        FileReader fr = new FileReader(f);
        String sql = "update customer set Transaction = ? where Email = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setCharacterStream(1, fr, f.length());
        pst.setString(2,email);
        pst.executeUpdate();
        fr.close();
    }
}