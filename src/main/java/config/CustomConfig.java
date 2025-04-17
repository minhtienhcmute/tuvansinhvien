package config;

//import com.cksource.ckfinder.config.Config;

public class CustomConfig {
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    private boolean enabled = false;
}
