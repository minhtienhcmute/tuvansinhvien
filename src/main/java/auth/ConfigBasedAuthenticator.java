package auth;

//import com.cksource.ckfinder.authentication.Authenticator;
//import config.CustomConfig;
//import jakarta.inject.Inject;
//import jakarta.inject.Named;
//import org.springframework.context.ApplicationContext;

/**
 * WARNING: Your authenticator should never simply return true. By doing so,
 * you are allowing "anyone" to upload and list the files on your server.
 * You should implement some kind of session validation mechanism to make
 * sure that only trusted users can upload or delete your files.
 */
//@Named
public class ConfigBasedAuthenticator {
//    @Inject
//    private ApplicationContext applicationContext;

    //    @Override
    public boolean authenticate() {
//        CustomConfig config = applicationContext.getBean(CustomConfig.class);
//
//        return config.isEnabled();
        return true;
    }
}
