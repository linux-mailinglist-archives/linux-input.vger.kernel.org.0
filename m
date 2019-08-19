Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA85951E7
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 01:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbfHSXwC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 19:52:02 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40702 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728765AbfHSXwC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 19:52:02 -0400
Received: by mail-qk1-f194.google.com with SMTP id s145so3007558qke.7
        for <linux-input@vger.kernel.org>; Mon, 19 Aug 2019 16:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=a/2XLdHfSdB0b6RIPrdy3mFXWwjPe+7l5bCqv2Lo3ZU=;
        b=mXpS0Puu27Rc54x05eebbDC0TGOxOcF7pPi9XLEJQiWepOTmboPHwcQutctjuE40SV
         0vOgp8/QSdSXeBFFS97m7rsH3qEZpkzmX9p/PGQIxU3bHembgxm4G8aoq49hGpkHYbuB
         fAo1Y5lgdMQn00YqCCJSGNFeAC+3IW7qj7JueJ2s2hYsplYGuPquLdsDCiZlg6nflUYS
         QKBnReyxrhpMPgaJtFUjqoXxZkCn02tA+QzvbR9x8qBKQMcTiM7CjkH8jWM2V5iTkpdM
         wovjXVvFfFP4VWCDNZiYXCLexf+qZsD03+XmfJZzxsd8qOCXvyVBC1VOMorVC8HSTAAr
         i5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=a/2XLdHfSdB0b6RIPrdy3mFXWwjPe+7l5bCqv2Lo3ZU=;
        b=rtspZJ3EDVrT+s5wkoJv+/vvHByyjTtxKrJVoZeQA4nmrQinP6R5QLjOIQTE/fnysZ
         loSzbGRlQeoV/aiWqJeENIO4SF/Eh+XHET/ML+8XGPhYQEH6eDX1cQuRXCK+DTo23xHy
         0BhVpRMWLmJ6DyQyFgXysv2NXyOYz5aIoLizh1fhSwEVAgvyqTshakSaOEz3c+AhxKZe
         SOPbPRTHeoijSU3oRE0zFf4+1GILmFPdXWsbyGJWuKoX396RUUJBfMQXLYZQCYCdh1mp
         F9SywKs5KFp8b5cnoojCM+wcyL9odHVH/4M75W90YJOx3d0StAm4Nmx4nPsT42qKwAu+
         NupA==
X-Gm-Message-State: APjAAAV+K8DBLuWerhtBvZm70LGsYxgJz8R7vKNi+2rBUU/Cygp4nhpZ
        HMzdVdKEAx+wWHmbpkG2Qaw+4Q==
X-Google-Smtp-Source: APXvYqwGNe8Ex149O1rS0+k/zybKrFzFtdGIiowvDePNSIyU8GYvbJ3wuW4uS2CwSOOrujZstu9ViA==
X-Received: by 2002:a05:620a:1590:: with SMTP id d16mr23669201qkk.18.1566258721246;
        Mon, 19 Aug 2019 16:52:01 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id r14sm8007255qke.47.2019.08.19.16.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 16:52:01 -0700 (PDT)
Date:   Mon, 19 Aug 2019 16:51:51 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Evgeniy Polyakov <zbr@ioremap.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, netdev@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 00/17] Use MFD framework for SGI IOC3 drivers
Message-ID: <20190819165151.6ebd3063@cakuba.netronome.com>
In-Reply-To: <20190819163144.3478-1-tbogendoerfer@suse.de>
References: <20190819163144.3478-1-tbogendoerfer@suse.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 19 Aug 2019 18:31:23 +0200, Thomas Bogendoerfer wrote:
>  - requested by Jakub I've splitted ioc3 ethernet driver changes into
>    more steps to make the transition more visible; 

Thanks a lot for doing that!
