Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E358194A67
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 22:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCZVUb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 17:20:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40215 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgCZVUb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 17:20:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so2641051plk.7;
        Thu, 26 Mar 2020 14:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F06HbeSH13tmadHlPUIc7xXdfNMkCGhMtH9KYmxotOo=;
        b=fFXkt+Gpe6pkYw3lf/GxaJSJkpn4BKdnzu1mu2Isq1MGEjXJQS8bylMaTL2gGLrQ8t
         9F2r6+1vMvJhOJTjPXIeqAcs5Ac5Lsovkeo1A1GTNZiF0hWyxA/KFxuwS7fR6s9xyspz
         84imtN9++lafe4Uy+PElkTLr8pfN6JnVBK2XCqdEsV9TUqgkX3DMp6usRRNfx2zezEnY
         gctqpCK2DMnGwvsA5gDpnplEC0jFp60GHaA+13Z2uOFEaZWfXdpU/FYmFVnjXxma0F3E
         954bjAp4ZJK8uP0qOvPt5IbaednqLHCudk/R2Au3E4PR3/leBlJyNKfI6Yuqt/aMYpIE
         PxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F06HbeSH13tmadHlPUIc7xXdfNMkCGhMtH9KYmxotOo=;
        b=IIS3MjmxGpxHi63hPSZW0wWK0Wht+mlRMgqenH6GyiI1ZBkI5S/AzAzWFaS0IwY+Qg
         /IrpvLhqYO/7AmTwksz6XSoidc7F/Wowuw4of33uYw9SgpKfWeDf+3+UD0u/af9pic/y
         rnMLDJ6Fur+t5q6ohdJ8Vd/El/zR2Ty+mck9W6vJcLRhqxKhgJ+n7GdOzFbmRWQGeN3j
         VLA8jeM48JXfH5jASwvoyV8N++3/9tpWaMzOANX/fzG3xIlFJnUaI1HGn1zN0dTEpoeL
         C/nvul6vE9m3YoD6fsJal3YfPZ69m5s0DkYWiUZdqIqH/KZCSjEEUA8q1XlIcezTSMAt
         dmnQ==
X-Gm-Message-State: ANhLgQ3V7uIttdqUP8BFRV2Rb2twzNWtmOXs3JI8n33eMksX6tHsS6cA
        B2BBwxFB0fYeIHGuEq1EETU=
X-Google-Smtp-Source: ADFU+vuzHEY5RAvOBEGDiHAwZbUDL/4CVJq+nw/xgu0Uz80a4eVgLhD86cf6SdnIoqsN/YpUvM2yKw==
X-Received: by 2002:a17:902:6b86:: with SMTP id p6mr10119027plk.150.1585257628839;
        Thu, 26 Mar 2020 14:20:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id p4sm2422722pfg.163.2020.03.26.14.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 14:20:28 -0700 (PDT)
Date:   Thu, 26 Mar 2020 14:20:25 -0700
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
Subject: Re: [PATCH v2 4/5] Input: atkbd: Receive and use physcode->keycode
 mapping from FW
Message-ID: <20200326212025.GH75430@dtor-ws>
References: <20200324123518.239768-1-rajatja@google.com>
 <20200324123518.239768-4-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324123518.239768-4-rajatja@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rajat,

On Tue, Mar 24, 2020 at 05:35:17AM -0700, Rajat Jain wrote:
> Allow the firmware to specify the mapping between the physical
> code and the linux keycode. This takes the form of a "keymap"
> property which is an array of u32 values, each value specifying
> mapping for a key.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v2: Remove the Change-Id from the commit log
> 
>  drivers/input/keyboard/atkbd.c | 39 ++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 7623eebef2593..c8017a5707581 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -66,6 +66,9 @@ MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard conne
>  
>  #define MAX_FUNCTION_ROW_KEYS	24
>  
> +#define PHYSCODE(keymap)	((keymap >> 16) & 0xFFFF)
> +#define KEYCODE(keymap)		(keymap & 0xFFFF)
> +
>  /*
>   * Scancode to keycode tables. These are just the default setting, and
>   * are loadable via a userland utility.
> @@ -236,6 +239,9 @@ struct atkbd {
>  
>  	u16 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
>  	int num_function_row_keys;
> +
> +	unsigned short fw_keymap[ATKBD_KEYMAP_SIZE];
> +	bool use_fw_keymap;

Why do we need to keep firmware-provided keymap in atkbd instance? It is
not going anywhere and can be accessed via device_property_* API
whenever we decide to refresh the keymap.

>  };
>  
>  /*
> @@ -1045,7 +1051,10 @@ static void atkbd_set_keycode_table(struct atkbd *atkbd)
>  	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
>  	bitmap_zero(atkbd->force_release_mask, ATKBD_KEYMAP_SIZE);
>  
> -	if (atkbd->translated) {
> +	if (atkbd->use_fw_keymap) {
> +		memcpy(atkbd->keycode, atkbd->fw_keymap,
> +		       sizeof(atkbd->keycode));
> +	} else if (atkbd->translated) {
>  		for (i = 0; i < 128; i++) {
>  			scancode = atkbd_unxlate_table[i];
>  			atkbd->keycode[i] = atkbd_set2_keycode[scancode];
> @@ -1163,7 +1172,9 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
>  {
>  	struct atkbd *atkbd = serio_get_drvdata(serio);
>  	struct device *dev = &serio->dev;
> -	int n;
> +	int i, n;
> +	u32 *ptr;
> +	u16 physcode, keycode;
>  
>  	if (!dev_fwnode(dev))
>  		return;
> @@ -1176,6 +1187,30 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
>  		atkbd->num_function_row_keys = n;
>  		dev_info(dev, "FW reported %d function-row key locations\n", n);
>  	}
> +
> +	/* Parse "keymap" property */
> +	n = device_property_count_u32(dev, "keymap");
> +	if (n > 0 && n <= ATKBD_KEYMAP_SIZE) {
> +
> +		ptr = kcalloc(n, sizeof(u32), GFP_KERNEL);
> +		if (!ptr)
> +			return;
> +
> +		if (device_property_read_u32_array(dev, "keymap", ptr, n)) {
> +			dev_err(dev, "problem parsing FW keymap property\n");
> +			kfree(ptr);
> +			return;
> +		}
> +
> +		for (i = 0; i < n; i++) {
> +			physcode = PHYSCODE(ptr[i]);
> +			keycode = KEYCODE(ptr[i]);
> +			atkbd->fw_keymap[physcode] = keycode;
> +		}
> +		dev_info(dev, "Using FW keymap (%d keys)\n", n);

This should be dev_dbg().

> +		atkbd->use_fw_keymap = true;
> +		kfree(ptr);
> +	}
>  }
>  
>  /*
> -- 
> 2.25.1.696.g5e7596f4ac-goog
> 

Thanks.

-- 
Dmitry
