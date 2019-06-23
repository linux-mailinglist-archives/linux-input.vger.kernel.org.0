Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1D24FA7B
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 08:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfFWGUE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 02:20:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36563 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFWGUD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 02:20:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id f21so5377289pgi.3;
        Sat, 22 Jun 2019 23:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9mpCqrfelo6ivquuYH6Epll54kxr4fDopqaPM+KB73k=;
        b=GjowxUFQ7hLaKNIKBcKBbwUlvOyGLvAxlsVjUwdrofHopuEPo+a1UkhztXW44sqgZh
         YRZKZ4lngUtqadckqRzHd1p99LYjwfpPfivMkXf8tjS41D1FlG/ZEeUWM8t8Xf+hTjIx
         N1lKhW3Wc9EAGQ9dFVq1MuLaZDmVtz9IkjWBe1N83PSmIbbtfw/+e0DfBp2886olDpLa
         9fxrtUKEoKB+trUP2fHwOxcy8k7iV/xWRxfWrvn2y+xUYX7Q2hRYF4eUTYj+dcwtMEYq
         9IMEsFBmD+xGOr4V52DKHrrRW9ivLZzuBc5G61dLPQHnTIzplPQtOxOXgsz4WrtgiiXU
         804g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9mpCqrfelo6ivquuYH6Epll54kxr4fDopqaPM+KB73k=;
        b=sqxGVIeiE4tNWMH5FgwxmrYXumE+Rve0YsMEsHC86pm2F1+XMLpZiMocGOQwJT+i84
         L3XnDE9e66Z1dAQTWPnsGcxSVYDVuDbJSjAVnHq6otMbta7HEXtCF0RubZw1hm1pwz0f
         ggdkkQqMWFbt/i5O+OawcanTNq4hb+As/5/gEk/bgiu5dIWfcjnUhe6jYLnDyn/v3WFF
         EsSN2pEQiZPS++obiBPYBwUAsQX+GbzAVPrWXh03LR9SFvbgL+74/p2hr43ceJlswk6M
         0xMcQ7cXKuDtWyKz6h6uv72Kk3xgpvdTY2I09cl28vEewSPOc04lHv66NMZlYgfG6UaC
         6NZg==
X-Gm-Message-State: APjAAAUejIRXFBrFty/TysuNEbvbZTcryhMvIgXI9NhyZJvIaBgOPJ/y
        isk2hBaa6xo0G1YAhI7QWxFk2Omn
X-Google-Smtp-Source: APXvYqxqBjv4+ha3Zmefe6KLGx/lx639gdMDP84kzUmCaXXSDPbDyQbP9a2WhTXO6Rx/bexVWBcWHA==
X-Received: by 2002:a65:6241:: with SMTP id q1mr26168583pgv.24.1561270802696;
        Sat, 22 Jun 2019 23:20:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id cx22sm8104481pjb.25.2019.06.22.23.20.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 22 Jun 2019 23:20:01 -0700 (PDT)
Date:   Sat, 22 Jun 2019 23:20:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        benjamin.tissoires@redhat.com
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        hdegoede@redhat.com, bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/5] Input: elan_i2c: Export the device id whitelist
Message-ID: <20190623062000.GB204275@dtor-ws>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
 <20190621145042.38637-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621145042.38637-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 21, 2019 at 07:50:42AM -0700, Jeffrey Hugo wrote:
> Elan_i2c and hid-quirks work in conjunction to decide which devices each
> driver will handle.  Elan_i2c has a whitelist of devices that should be
> consumed by hid-quirks so that there is one master list of devices to
> handoff between the drivers.  Put the ids in a header file so that
> hid-quirks can consume it instead of duplicating the list.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Benjamin, are you happy with this version?

Thanks.

-- 
Dmitry
