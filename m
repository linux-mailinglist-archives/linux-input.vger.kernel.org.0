Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970B31B8175
	for <lists+linux-input@lfdr.de>; Fri, 24 Apr 2020 23:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgDXVDU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Apr 2020 17:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgDXVDU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Apr 2020 17:03:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356CBC09B048;
        Fri, 24 Apr 2020 14:03:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a7so4386094pju.2;
        Fri, 24 Apr 2020 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZknRY+ED4Rci10RQgZ5KLUNuZwg2P5QWQY0A1F9mV4E=;
        b=hphE9Ehti93jXXiIfv9SCmt1TeErLdGL89RPBfZCeVjiSHwooSXmlWfqfRI2mDhaCo
         1p3iY0nxZgUwElQxHhNtaefO3Vqlm9qd/ccZSO8ad15rHth3GhnMzsAaBBab8LgKknkv
         7uMwMK/R639q+MT8eSJUHKP+Y/H/FRNKbWk8cOK7uyKc8YpI+vUbvuP9vadsdZUFBvG8
         ZvC87Ii2vT6oypL5OEC+xWef5/MUshNGnxdoenqgcYFy7/xsNa+MKteu2RGzviOLMKgx
         wOZipQ/xXjYnoC6Jz7D5sW1GaQkeRbrnKqyLAWetLOsIPk1ti4nsv8IccaRL6I5v2sjd
         lYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZknRY+ED4Rci10RQgZ5KLUNuZwg2P5QWQY0A1F9mV4E=;
        b=Nwn+WAgHue0WeEUWWjxIfl1P+21XaXe7mldJ1XI0axOFULYF6YWXgT9rEIthz7U+ud
         jHoQS/JCckTddWMSJe9gOhsrnGz713oqggSM3ew3LOczBBNCpZFfMSTyBi9umLpeCVY6
         NSZZ4aK6X+ujkELlyY2oaesjq2FNW9w5afzzurYoHXXnmN71xRmJ7DiiSvJDae7EsfIl
         6Iq4tF9x7McEECwX37yDPxtrcS3pTYRymuH5XoQdy8ILNAOJcMKHS49c6zIDuZHgbr5Z
         059EBZRt8tk9JLfh6LXXx3N8fJd+vkIGewzWqSlI3WdLJe55Wqccki6fv+ufTMuGXbf2
         nMiw==
X-Gm-Message-State: AGi0Pub548a8lZZb3X+1fFMQTRklhiTYzweEcWYZRCYR56Nws5oOYpf8
        4AVNuN7if3InicZfswmhHAjSWvvB
X-Google-Smtp-Source: APiQypKJZGHlzUhqTrUKYo3As8yT7reZGH+s/LyNtQsjNcDivk9xdGtLO7MoIPiZIte2R8ne7f9BwQ==
X-Received: by 2002:a17:902:b78b:: with SMTP id e11mr10926839pls.311.1587762199439;
        Fri, 24 Apr 2020 14:03:19 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id r23sm6762811pfr.64.2020.04.24.14.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 14:03:18 -0700 (PDT)
Date:   Fri, 24 Apr 2020 14:03:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     dtor@google.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com, rajatxjain@gmail.com
Subject: Re: [PATCH v4 2/5] Input: atkbd: Expose function row physical map to
 userspace
Message-ID: <20200424210316.GI125362@dtor-ws>
References: <20200328185916.98423-1-rajatja@google.com>
 <20200328185916.98423-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328185916.98423-2-rajatja@google.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rajat,

On Sat, Mar 28, 2020 at 11:59:13AM -0700, Rajat Jain wrote:
> Certain keyboards have their top-row keys intended
> for actions such as "Browser back", "Browser Refresh", "Fullscreen"
> etc as their primary mode, thus they will send physical codes for those
> actions. Further, they don't have a dedicated "Fn" key so don't have
> the capability to generate function key codes (e.g. F1, F2 etc..).
> However in this case, if userspace still wants to "synthesize" those
> function keys using the top row action keys, it needs to know the
> physical position of the top row keys. (Essentially a mapping between
> usage codes and a physical location in the top row).
> 
> This patch enhances the atkbd driver to receive such a mapping from the
> firmware / device tree, and expose it to userspace in the form of
> a function-row-physmap attribute. The attribute would be a space
> separated ordered list of physical codes, for the keys in the function
> row, in left-to-right order.
> 
> The attribute will only be present if the kernel knows about such
> mapping, otherwise the attribute shall not be visible.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v4: Same as v3
> v3: Change to dev_dbg and remove unecessary error check
> v2: Remove the Change-Id from the commit log
> 
>  drivers/input/keyboard/atkbd.c | 56 ++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 7e3eae54c1926..3b20aba1861cd 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -24,6 +24,7 @@
>  #include <linux/libps2.h>
>  #include <linux/mutex.h>
>  #include <linux/dmi.h>
> +#include <linux/property.h>
>  
>  #define DRIVER_DESC	"AT and PS/2 keyboard driver"
>  
> @@ -63,6 +64,8 @@ static bool atkbd_terminal;
>  module_param_named(terminal, atkbd_terminal, bool, 0);
>  MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard connected via AT/PS2");
>  
> +#define MAX_FUNCTION_ROW_KEYS	24
> +
>  /*
>   * Scancode to keycode tables. These are just the default setting, and
>   * are loadable via a userland utility.
> @@ -230,6 +233,9 @@ struct atkbd {
>  
>  	/* Serializes reconnect(), attr->set() and event work */
>  	struct mutex mutex;
> +
> +	u16 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
> +	int num_function_row_keys;
>  };
>  
>  /*
> @@ -283,6 +289,7 @@ static struct device_attribute atkbd_attr_##_name =				\
>  	__ATTR(_name, S_IRUGO, atkbd_do_show_##_name, NULL);
>  
>  ATKBD_DEFINE_RO_ATTR(err_count);
> +ATKBD_DEFINE_RO_ATTR(function_row_physmap);
>  
>  static struct attribute *atkbd_attributes[] = {
>  	&atkbd_attr_extra.attr,
> @@ -292,11 +299,42 @@ static struct attribute *atkbd_attributes[] = {
>  	&atkbd_attr_softrepeat.attr,
>  	&atkbd_attr_softraw.attr,
>  	&atkbd_attr_err_count.attr,
> +	&atkbd_attr_function_row_physmap.attr,
>  	NULL
>  };
>  
> +static ssize_t atkbd_show_function_row_physmap(struct atkbd *atkbd, char *buf)
> +{
> +	ssize_t size = 0;
> +	int i;
> +
> +	if (!atkbd->num_function_row_keys)
> +		return 0;
> +
> +	for (i = 0; i < atkbd->num_function_row_keys; i++)
> +		size += sprintf(buf + size, "%02X ",
> +				atkbd->function_row_physmap[i]);
> +	size += sprintf(buf + size, "\n");

Can we change this to scnprintf() with PAGE_SIZE as the initial limit?

> +	return size;
> +}
> +
> +static umode_t atkbd_attr_is_visible(struct kobject *kobj,
> +				struct attribute *attr, int i)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct serio *serio = to_serio_port(dev);
> +	struct atkbd *atkbd = serio_get_drvdata(serio);
> +
> +	if (attr == &atkbd_attr_function_row_physmap.attr &&
> +	    !atkbd->num_function_row_keys)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>  static struct attribute_group atkbd_attribute_group = {
>  	.attrs	= atkbd_attributes,
> +	.is_visible = atkbd_attr_is_visible,
>  };
>  
>  static const unsigned int xl_table[] = {
> @@ -1121,6 +1159,22 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
>  	}
>  }
>  
> +static void atkbd_parse_fwnode_data(struct serio *serio)
> +{
> +	struct atkbd *atkbd = serio_get_drvdata(serio);
> +	struct device *dev = &serio->dev;
> +	int n;
> +
> +	/* Parse "function-row-physmap" property */
> +	n = device_property_count_u16(dev, "function-row-physmap");

I think for ACPI case it does not matter, but if we ever have device
tree using it, it will lead to less errors if we use u32 as the element
size. Do you mind switching to it?

> +	if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
> +	    !device_property_read_u16_array(dev, "function-row-physmap",
> +					    atkbd->function_row_physmap, n)) {
> +		atkbd->num_function_row_keys = n;
> +		dev_dbg(dev, "FW reported %d function-row key locations\n", n);
> +	}
> +}
> +
>  /*
>   * atkbd_connect() is called when the serio module finds an interface
>   * that isn't handled yet by an appropriate device driver. We check if
> @@ -1184,6 +1238,8 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
>  		atkbd->id = 0xab00;
>  	}
>  
> +	atkbd_parse_fwnode_data(serio);
> +
>  	atkbd_set_keycode_table(atkbd);
>  	atkbd_set_device_attrs(atkbd);
>  

Thanks.

-- 
Dmitry
