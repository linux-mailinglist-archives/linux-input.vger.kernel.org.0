Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9109A96908
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 21:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbfHTTH0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 15:07:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34725 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730628AbfHTTH0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 15:07:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so3952891pfp.1
        for <linux-input@vger.kernel.org>; Tue, 20 Aug 2019 12:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C2WAhE5PmBkXc3zmBZf/icO+i/DafkFznONWpVRnBUo=;
        b=YTjzDFgbDYp5ZE9i0w4fXkKHYfDXGWjKGOZIGBKGzytrj2rNf8hSg6W0n4UwMeE4nJ
         Lgt/wnR0jYrr1ykn0s77EUguMVFrZsS3lZHj/qfLE/ALJeksJJ523tyQw1BMzoHOW6kR
         qnGyQd0olOQs4dXab/eK7ieSDU4B9C/27cjHxCODaP+unTnCjjBbvbkkODXWxxy4EASX
         AAPDIBXHl2KPVsncmTKbVpgWwHr7bXPCY+JICD2GeAsPerdFCREkuZd4Y2oy3MZCr5bt
         yNarMZbP0532ZGpZOwHmryNyWi8zakp0vJV/Svwukd7J+PgauPRnRcnRzre2nYuKEyb9
         G8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C2WAhE5PmBkXc3zmBZf/icO+i/DafkFznONWpVRnBUo=;
        b=LFX3KS4rW8AyT9tf53zfEK60xHEAEshl7FHb6mMBTBI1BJ5x8T4BpROm0BZCG8dfM2
         JErazMYInuUKSBwTG9UCyqMvIT7Kspx+Vgg/yjbxxQyg48LdT03Yn0mrOipMyxmngC/Z
         9uOX/d/uzgqXBXdq3erLjxZAAHUyGD6Nkkjf++LwC4eFGS1148bkT16DDofqqYhcnaHW
         K7YOoLYSHoR+EGGbH5VrC67KVq9xmmG5g4cNWdt6XJqJAMiNNJ7ZPc6Y7TMrzaQQOmDe
         vwLjcZ0zXQQcQYIAnbVN+28APE3+Mhk9Se200U408fc4dj0YFr0FDNvltHAy2GuFLrYs
         N9+A==
X-Gm-Message-State: APjAAAXRuf3ofwG+uXTKKbfi5xA4ACq+YfdXPny+LES3vdKLunSPLpfw
        qCNKtRM9wz5eDbiuMnwhaCI=
X-Google-Smtp-Source: APXvYqzMJJ4dESBa+B/2KOk48X+DUiLtRbItQz8bJalRe2PqB63OJ9tQ9C9JXkD1MWNdhnF0NEe6bA==
X-Received: by 2002:a63:b555:: with SMTP id u21mr26396955pgo.222.1566328045357;
        Tue, 20 Aug 2019 12:07:25 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s6sm19889705pfs.122.2019.08.20.12.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 12:07:24 -0700 (PDT)
Date:   Tue, 20 Aug 2019 12:07:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: psmouse - drop all unneeded functions from
 mouse headers
Message-ID: <20190820190722.GQ121898@dtor-ws>
References: <20190820053650.8847-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820053650.8847-1-hui.wang@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 20, 2019 at 01:36:50PM +0800, Hui Wang wrote:
> Recently we had a building error if we enable the MOUSE_PS2_ALPS while
> disable the MOUSE_PS2_TRACKPOINT, and was fixed by 49e6979e7e92
> ("Input: psmouse - fix build error of multiple definition").
> 
> We could improve that fix by dropping all unneeded functions and
> CONFIG_MOUSE_ guards from the header, it is safe to do that since
> those functions are not directly called by psmouse-base.c anymore.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Applied, thank you.

> ---
>  drivers/input/mouse/alps.h         | 11 -----------
>  drivers/input/mouse/byd.h          | 11 -----------
>  drivers/input/mouse/cypress_ps2.h  | 11 -----------
>  drivers/input/mouse/elantech.h     | 18 ++----------------
>  drivers/input/mouse/hgpk.h         | 13 +++----------
>  drivers/input/mouse/lifebook.h     | 13 +++----------
>  drivers/input/mouse/logips2pp.h    |  7 -------
>  drivers/input/mouse/sentelic.h     | 11 -----------
>  drivers/input/mouse/touchkit_ps2.h |  8 --------
>  drivers/input/mouse/trackpoint.h   |  8 --------
>  drivers/input/mouse/vmmouse.h      | 11 -----------
>  11 files changed, 8 insertions(+), 114 deletions(-)
> 
> diff --git a/drivers/input/mouse/alps.h b/drivers/input/mouse/alps.h
> index f4bab629739c..0a1048cf23f6 100644
> --- a/drivers/input/mouse/alps.h
> +++ b/drivers/input/mouse/alps.h
> @@ -323,18 +323,7 @@ struct alps_data {
>  
>  #define ALPS_QUIRK_TRACKSTICK_BUTTONS	1 /* trakcstick buttons in trackstick packet */
>  
> -#ifdef CONFIG_MOUSE_PS2_ALPS
>  int alps_detect(struct psmouse *psmouse, bool set_properties);
>  int alps_init(struct psmouse *psmouse);
> -#else
> -inline int alps_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -inline int alps_init(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_MOUSE_PS2_ALPS */
>  
>  #endif
> diff --git a/drivers/input/mouse/byd.h b/drivers/input/mouse/byd.h
> index 8cb90d904186..ff2771e2dd2e 100644
> --- a/drivers/input/mouse/byd.h
> +++ b/drivers/input/mouse/byd.h
> @@ -2,18 +2,7 @@
>  #ifndef _BYD_H
>  #define _BYD_H
>  
> -#ifdef CONFIG_MOUSE_PS2_BYD
>  int byd_detect(struct psmouse *psmouse, bool set_properties);
>  int byd_init(struct psmouse *psmouse);
> -#else
> -static inline int byd_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -static inline int byd_init(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_MOUSE_PS2_BYD */
>  
>  #endif /* _BYD_H */
> diff --git a/drivers/input/mouse/cypress_ps2.h b/drivers/input/mouse/cypress_ps2.h
> index 1eaddd818004..bb4979d06bf9 100644
> --- a/drivers/input/mouse/cypress_ps2.h
> +++ b/drivers/input/mouse/cypress_ps2.h
> @@ -170,18 +170,7 @@ struct cytp_data {
>  };
>  
>  
> -#ifdef CONFIG_MOUSE_PS2_CYPRESS
>  int cypress_detect(struct psmouse *psmouse, bool set_properties);
>  int cypress_init(struct psmouse *psmouse);
> -#else
> -inline int cypress_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -inline int cypress_init(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_MOUSE_PS2_CYPRESS */
>  
>  #endif  /* _CYPRESS_PS2_H */
> diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
> index 46343998522b..e0a3e59d4f1b 100644
> --- a/drivers/input/mouse/elantech.h
> +++ b/drivers/input/mouse/elantech.h
> @@ -184,32 +184,18 @@ struct elantech_data {
>  	void (*original_set_rate)(struct psmouse *psmouse, unsigned int rate);
>  };
>  
> -#ifdef CONFIG_MOUSE_PS2_ELANTECH
>  int elantech_detect(struct psmouse *psmouse, bool set_properties);
>  int elantech_init_ps2(struct psmouse *psmouse);
> +
> +#ifdef CONFIG_MOUSE_PS2_ELANTECH
>  int elantech_init(struct psmouse *psmouse);
>  #else
> -static inline int elantech_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
>  static inline int elantech_init(struct psmouse *psmouse)
>  {
>  	return -ENOSYS;
>  }
> -static inline int elantech_init_ps2(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
>  #endif /* CONFIG_MOUSE_PS2_ELANTECH */
>  
> -#if defined(CONFIG_MOUSE_PS2_ELANTECH_SMBUS)
>  int elantech_init_smbus(struct psmouse *psmouse);
> -#else
> -static inline int elantech_init_smbus(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_MOUSE_PS2_ELANTECH_SMBUS */
>  
>  #endif
> diff --git a/drivers/input/mouse/hgpk.h b/drivers/input/mouse/hgpk.h
> index 98b7b384229b..ce041591f1a8 100644
> --- a/drivers/input/mouse/hgpk.h
> +++ b/drivers/input/mouse/hgpk.h
> @@ -47,22 +47,15 @@ struct hgpk_data {
>  	int xsaw_secondary, ysaw_secondary; /* jumpiness detection */
>  };
>  
> -#ifdef CONFIG_MOUSE_PS2_OLPC
> -void hgpk_module_init(void);
>  int hgpk_detect(struct psmouse *psmouse, bool set_properties);
>  int hgpk_init(struct psmouse *psmouse);
> +
> +#ifdef CONFIG_MOUSE_PS2_OLPC
> +void hgpk_module_init(void);
>  #else
>  static inline void hgpk_module_init(void)
>  {
>  }
> -static inline int hgpk_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENODEV;
> -}
> -static inline int hgpk_init(struct psmouse *psmouse)
> -{
> -	return -ENODEV;
> -}
>  #endif
>  
>  #endif
> diff --git a/drivers/input/mouse/lifebook.h b/drivers/input/mouse/lifebook.h
> index 573f2ca1983d..d989cca62dd6 100644
> --- a/drivers/input/mouse/lifebook.h
> +++ b/drivers/input/mouse/lifebook.h
> @@ -8,22 +8,15 @@
>  #ifndef _LIFEBOOK_H
>  #define _LIFEBOOK_H
>  
> -#ifdef CONFIG_MOUSE_PS2_LIFEBOOK
> -void lifebook_module_init(void);
>  int lifebook_detect(struct psmouse *psmouse, bool set_properties);
>  int lifebook_init(struct psmouse *psmouse);
> +
> +#ifdef CONFIG_MOUSE_PS2_LIFEBOOK
> +void lifebook_module_init(void);
>  #else
>  static inline void lifebook_module_init(void)
>  {
>  }
> -static inline int lifebook_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -static inline int lifebook_init(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
>  #endif
>  
>  #endif
> diff --git a/drivers/input/mouse/logips2pp.h b/drivers/input/mouse/logips2pp.h
> index 5f9344135f70..df885c4874df 100644
> --- a/drivers/input/mouse/logips2pp.h
> +++ b/drivers/input/mouse/logips2pp.h
> @@ -8,13 +8,6 @@
>  #ifndef _LOGIPS2PP_H
>  #define _LOGIPS2PP_H
>  
> -#ifdef CONFIG_MOUSE_PS2_LOGIPS2PP
>  int ps2pp_detect(struct psmouse *psmouse, bool set_properties);
> -#else
> -static inline int ps2pp_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_MOUSE_PS2_LOGIPS2PP */
>  
>  #endif
> diff --git a/drivers/input/mouse/sentelic.h b/drivers/input/mouse/sentelic.h
> index dc88a93adf85..02cac0e7ad63 100644
> --- a/drivers/input/mouse/sentelic.h
> +++ b/drivers/input/mouse/sentelic.h
> @@ -106,19 +106,8 @@ struct fsp_data {
>  	unsigned int	last_mt_fgr;	/* Last seen finger(multitouch) */
>  };
>  
> -#ifdef CONFIG_MOUSE_PS2_SENTELIC
>  extern int fsp_detect(struct psmouse *psmouse, bool set_properties);
>  extern int fsp_init(struct psmouse *psmouse);
> -#else
> -static inline int fsp_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -static inline int fsp_init(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
> -#endif
>  
>  #endif	/* __KERNEL__ */
>  
> diff --git a/drivers/input/mouse/touchkit_ps2.h b/drivers/input/mouse/touchkit_ps2.h
> index 5acb76464a5b..c808fe6c782f 100644
> --- a/drivers/input/mouse/touchkit_ps2.h
> +++ b/drivers/input/mouse/touchkit_ps2.h
> @@ -9,14 +9,6 @@
>  #ifndef _TOUCHKIT_PS2_H
>  #define _TOUCHKIT_PS2_H
>  
> -#ifdef CONFIG_MOUSE_PS2_TOUCHKIT
>  int touchkit_ps2_detect(struct psmouse *psmouse, bool set_properties);
> -#else
> -static inline int touchkit_ps2_detect(struct psmouse *psmouse,
> -				      bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_MOUSE_PS2_TOUCHKIT */
>  
>  #endif
> diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
> index 77110f3ec21d..5cb93ed26085 100644
> --- a/drivers/input/mouse/trackpoint.h
> +++ b/drivers/input/mouse/trackpoint.h
> @@ -155,14 +155,6 @@ struct trackpoint_data {
>  	bool ext_dev;
>  };
>  
> -#ifdef CONFIG_MOUSE_PS2_TRACKPOINT
>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
> -#else
> -static inline int trackpoint_detect(struct psmouse *psmouse,
> -				    bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_MOUSE_PS2_TRACKPOINT */
>  
>  #endif /* _TRACKPOINT_H */
> diff --git a/drivers/input/mouse/vmmouse.h b/drivers/input/mouse/vmmouse.h
> index 774549a12930..90157aecade7 100644
> --- a/drivers/input/mouse/vmmouse.h
> +++ b/drivers/input/mouse/vmmouse.h
> @@ -8,20 +8,9 @@
>  #ifndef _VMMOUSE_H
>  #define _VMMOUSE_H
>  
> -#ifdef CONFIG_MOUSE_PS2_VMMOUSE
>  #define VMMOUSE_PSNAME  "VirtualPS/2"
>  
>  int vmmouse_detect(struct psmouse *psmouse, bool set_properties);
>  int vmmouse_init(struct psmouse *psmouse);
> -#else
> -static inline int vmmouse_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -static inline int vmmouse_init(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
> -#endif
>  
>  #endif
> -- 
> 2.17.1
> 

-- 
Dmitry
