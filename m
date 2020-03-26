Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48DB194A88
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 22:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgCZV1K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 17:27:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43697 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCZV1K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 17:27:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id f206so3425856pfa.10;
        Thu, 26 Mar 2020 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=atzCXrrFjj2ubJLyaQL33TZVkzc/684qlpDQkAgpr+Y=;
        b=BH+pMBLVwLvDOujw8Wx0UntU90jOTEQ6Zs10qYxLzPGwVpM/cLw9JEfTvd975olj1y
         zrSwqx5diNTHuNEuqTGjucX0e9E7NzEdwX2eERxjch4vKtewxQBqNdLpgqiIH2KCS3cF
         +8kGVlcQfKVeFZILXyme5LG3xF1RUSt5UWRl9PVL1KDDrxB5hemkZo3f2Z73XJxDc+1L
         JhySK730Nhbn5ut3/1zcHRodB1PyjZGUC+hC+Ocd0KXOT77tGO3rjr47NgHmuzVtZMZZ
         hjcpb2qVoEzF62N9YMDXsHdXfHwNDLVQlSlzOyMxsaGkJGumnjVgwIUIVDjUCjEZclYA
         yj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=atzCXrrFjj2ubJLyaQL33TZVkzc/684qlpDQkAgpr+Y=;
        b=MNju2wjrob0xH+4I4geD9H9u7JoN2cQPtLr0lDRq/TWXw9XSnoGShiLT+3TKDslbPP
         omwPBpDXRjRykVSKUq99JSZ7OA32FGV+o1Z5VoiPp3Kh0QmHmsrLF6wqWB1PpqahEnoM
         rQqtg8n96LhwMG2T6egdurcUHSYzP3MoD6OSuL6bZL21dRfqkOOTpSpLtfWDbhCvm9oc
         xsPlvU+Qx5RaLw3IeT3pEO5jfkzCzIc9zellJ02vm52n5aUZ6FvdT0XLrfwRXfGY+ZTS
         cPHbsAj6eSdcfQsZoZiMmJwzYhbSCWGZPWvSeLBJcPPyego1ZtrV2Bf4wHRyJ8Noomxt
         19WA==
X-Gm-Message-State: ANhLgQ05j5RQ345gDnX+Jp3grwxTIlrCx5LC1ceM/4LMBHWZvmRmbJBd
        s9phDsI9Mor2cdiSg0fHxqA=
X-Google-Smtp-Source: ADFU+vtcHF1HaTi5i3fGgGxyPVPOVW6A4n02mzw7SrTcycZINqW9FTsKBRVMJgTYQXn8HfVGU/2b1w==
X-Received: by 2002:a63:7409:: with SMTP id p9mr10470856pgc.206.1585258028572;
        Thu, 26 Mar 2020 14:27:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a127sm2434878pfa.111.2020.03.26.14.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 14:27:07 -0700 (PDT)
Date:   Thu, 26 Mar 2020 14:27:05 -0700
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
Subject: Re: [PATCH v2 2/5] Input: atkbd: Expose function row physical map to
 userspace
Message-ID: <20200326212705.GJ75430@dtor-ws>
References: <20200324123518.239768-1-rajatja@google.com>
 <20200324123518.239768-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324123518.239768-2-rajatja@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 24, 2020 at 05:35:15AM -0700, Rajat Jain wrote:
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
> v2: Remove the Change-Id from the commit log
> 
>  drivers/input/keyboard/atkbd.c | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 7e3eae54c1926..7623eebef2593 100644
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
> @@ -1121,6 +1159,25 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
>  	}
>  }
>  
> +static void atkbd_parse_fwnode_data(struct serio *serio)
> +{
> +	struct atkbd *atkbd = serio_get_drvdata(serio);
> +	struct device *dev = &serio->dev;
> +	int n;
> +
> +	if (!dev_fwnode(dev))
> +		return;

I do not think we need this guard.

> +
> +	/* Parse "function-row-physmap" property */
> +	n = device_property_count_u16(dev, "function-row-physmap");
> +	if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
> +	    !device_property_read_u16_array(dev, "function-row-physmap",
> +					    atkbd->function_row_physmap, n)) {
> +		atkbd->num_function_row_keys = n;
> +		dev_info(dev, "FW reported %d function-row key locations\n", n);

dev_dbg().

> +	}
> +}
> +
>  /*
>   * atkbd_connect() is called when the serio module finds an interface
>   * that isn't handled yet by an appropriate device driver. We check if
> @@ -1184,6 +1241,8 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
>  		atkbd->id = 0xab00;
>  	}
>  
> +	atkbd_parse_fwnode_data(serio);
> +
>  	atkbd_set_keycode_table(atkbd);
>  	atkbd_set_device_attrs(atkbd);
>  
> -- 
> 2.25.1.696.g5e7596f4ac-goog
> 

-- 
Dmitry
