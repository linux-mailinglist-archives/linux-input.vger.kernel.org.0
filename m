Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA65A194A7C
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 22:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgCZVZK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 17:25:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42998 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCZVZJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 17:25:09 -0400
Received: by mail-pl1-f194.google.com with SMTP id e1so2641115plt.9;
        Thu, 26 Mar 2020 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EBWQLMhBWW9tUXFqRtN+54ezrMGzdq5O+dIYEBDryGo=;
        b=pNXo66Iib9dd51AfI5Kn4XmPlsuG+DRgfO1pjoxT4heP/wOCW7mxQTZC1t3rfCPH6H
         ZPn3zDNE7oKFFDxenXlJcJR80p2r6GK5sCHHDoZ3ySW1D1qG2ktEN15caUI22xpp2sM6
         mW396gjndbFQxz1SSdNnhYN2A9iQYRRWo9jFQHmFWnSlikmitltJJmNn/WERBMcOjZwK
         62IAGF1BBNH81+9x0ai/nqraL9/CcX+M2s24mLpp0MC9MCHzAqTO7KHFbSi3sNiaAAqG
         ivimQr5jFdzihlMrpQmqIoyoPgAi/2GUrYtG406ApmsRrjtPdkklkY2zPuofa0A+qrlO
         mUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EBWQLMhBWW9tUXFqRtN+54ezrMGzdq5O+dIYEBDryGo=;
        b=a9s1aSpsZGLtYSetQTIFHllFhzCq5hbgwCmUHJUS2HE7ZhLh4WReXahsbkHylIQwcz
         lmKkkjMNC4OX/kSSCq4UOr/CKVtvKUp6q1Buk3999CrmuHdR10RN+8/DVBJnwBC/LDS5
         48OqWumvfrJhpKquIiI26qPUA9TMrgziUEdbCJ5BfR3yOQYRm74LRGrARWzRyD2S9D/S
         gKZ8xKOtv8LoHl4NBLnqQ2b2NYbVUMJSju0B9Jqj+rn8nk4fExxy7N/NkPDro66ccYnm
         YhoBMOFl1+4QApO7yFBd6p3I8VqlTL1rxWAR72o6FHNb4Lcy4hzpq+VgEzhOlM3AQLLm
         3qKA==
X-Gm-Message-State: ANhLgQ1V8eoFdJ+P+oLvpDsz2MP43h6YrLFtQ2eCOl4M+82e4HkBMfBE
        lJdHin3x89bFcFh+Bt3v4TY=
X-Google-Smtp-Source: ADFU+vs0BBrk9+I2ddFEda+vQXmS5Jnv3BmW48JpttlOLT46IZkR0GLF9ueX6C/NeKude51qt3Se2g==
X-Received: by 2002:a17:90a:1910:: with SMTP id 16mr2172311pjg.119.1585257908641;
        Thu, 26 Mar 2020 14:25:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id nk12sm2354537pjb.41.2020.03.26.14.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 14:25:08 -0700 (PDT)
Date:   Thu, 26 Mar 2020 14:25:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
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
        dbehr@google.com, rajatxjain@gmail.com,
        Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2 1/5] input/serio/i8042: Attach fwnode to serio i8042
 kbd device
Message-ID: <20200326212505.GI75430@dtor-ws>
References: <20200324123518.239768-1-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324123518.239768-1-rajatja@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 24, 2020 at 05:35:14AM -0700, Rajat Jain wrote:
> Attach the firmware node to the serio i8042 kbd device so that device
> properties can be passed from the firmware.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v2: Remove the Change-Id from the commit log
> 
>  drivers/input/serio/i8042-x86ia64io.h | 1 +
>  drivers/input/serio/i8042.c           | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
> index dc974c288e880..ed9ec4310d976 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -927,6 +927,7 @@ static int i8042_pnp_kbd_probe(struct pnp_dev *dev, const struct pnp_device_id *
>  	}
>  	i8042_pnp_id_to_string(dev->id, i8042_kbd_firmware_id,
>  			       sizeof(i8042_kbd_firmware_id));
> +	i8042_kbd_fwnode = dev_fwnode(&dev->dev);
>  
>  	/* Keyboard ports are always supposed to be wakeup-enabled */
>  	device_set_wakeup_enable(&dev->dev, true);
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 20ff2bed3917a..0dddf273afd94 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -21,6 +21,7 @@
>  #include <linux/i8042.h>
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
> +#include <linux/property.h>
>  
>  #include <asm/io.h>
>  
> @@ -124,6 +125,7 @@ MODULE_PARM_DESC(unmask_kbd_data, "Unconditional enable (may reveal sensitive da
>  static bool i8042_bypass_aux_irq_test;
>  static char i8042_kbd_firmware_id[128];
>  static char i8042_aux_firmware_id[128];
> +static struct fwnode_handle *i8042_kbd_fwnode;
>  
>  #include "i8042.h"
>  
> @@ -1335,6 +1337,7 @@ static int __init i8042_create_kbd_port(void)
>  	strlcpy(serio->phys, I8042_KBD_PHYS_DESC, sizeof(serio->phys));
>  	strlcpy(serio->firmware_id, i8042_kbd_firmware_id,
>  		sizeof(serio->firmware_id));
> +	set_primary_fwnode(&serio->dev, i8042_kbd_fwnode);

Rafael, do you have any concerns here? We want to be able to access
properties assigned to KBC or similar device in ACPI. Serio port devices
in i8042 essentially mirror the 2 PNP (typically called KBC, PS2K or
PS2M) devices in ACPI.

Thanks.

-- 
Dmitry
