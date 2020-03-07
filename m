Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE8D417D06F
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 23:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgCGWSs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 17:18:48 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38434 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgCGWSr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Mar 2020 17:18:47 -0500
Received: by mail-pf1-f193.google.com with SMTP id g21so2992754pfb.5;
        Sat, 07 Mar 2020 14:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CNf7VjRNOCMXZxG3+opiLe00WO3yr3pvz1qUMkdEfqA=;
        b=BrXQ7DIB6A9xICFvV3iVGX+NyUoWasxbMExTpGP4N2ViSEC6mmtEgNTlgipVrbAGHf
         yOgWKnKo5h0rNqVsM/J2oe997YoOOU4QrRjwtidbVZKpbkn8DTnzm+jCEYyEktoOiTEi
         sHRnbYVCA6/Y5VaZqNNx1169ZKLODpHmvmI8Wz3KLybucrtC1sVDJHSB5Lo6OE0+yuQk
         UvR7apCRJkVxMZQTyfAJk6NwCoPbs6cRl5sygv910aK18K9U2mHBNp4Cnys8Bs3lNW2V
         /INx5+o+J50S1r5IAos6DBWUMPKCy9BgCDBY0axpaamxV1AubUjw5EZE/M9aGUawb5Kw
         oIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CNf7VjRNOCMXZxG3+opiLe00WO3yr3pvz1qUMkdEfqA=;
        b=hnDL0bSUycTKOFSxq+EnY059W8B/qNBNk7rzExPA5n8QLYb2S9iC2/WH18zxQ4FJVI
         B4VBt/FbPLBXXz3hACtwGBCawMeU8kxwmkgjnkW7mx8V95BJxaFm63Pq00e0XvQOiUXO
         gwewg45P6EvDKmEBb+KCSStnawu+KSrx1TUFhf/qS2Rvs34SUOiNGiW5jfGJMAve+d+o
         tKlP7TgPpnhc45Vda0DoCjBrgdWkdUoczQaVOXsp2NN6a0XW1M6v1K5SizBHfsVbeYMj
         eluOwj/k4G49YKvmmql+CH0IJzKlKacqdfpBE/1XboPLyg+KX0m5oJ4fQut+lko3MucE
         L+pg==
X-Gm-Message-State: ANhLgQ2O5EjjMnvUOHp8hrzIEugNYG+baOnTbwJhe/2IPefpCldqNK7d
        VRvpPepzABhWmjDVA0DN6DY=
X-Google-Smtp-Source: ADFU+vsKvO4mC0Ca8PRoNrRoOELdA/9E4R6H9O+lwHdd7TLOwU4ebUQvOIWpiKM1gCdm0YNQZ39Ucw==
X-Received: by 2002:a62:507:: with SMTP id 7mr10657790pff.49.1583619526460;
        Sat, 07 Mar 2020 14:18:46 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t142sm30875639pgb.31.2020.03.07.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 14:18:45 -0800 (PST)
Date:   Sat, 7 Mar 2020 14:18:43 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yussuf Khalil <dev@pp3345.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - Enable RMI on HP Envy 13-ad105ng
Message-ID: <20200307221843.GR217608@dtor-ws>
References: <20200307213508.267187-1-dev@pp3345.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200307213508.267187-1-dev@pp3345.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yussuf,

On Sat, Mar 07, 2020 at 10:35:08PM +0100, Yussuf Khalil wrote:
> This laptop (and perhaps other variants of the same model) reports an
> SMBus-capable Synaptics touchpad. Everything (including suspend and
> resume) works fine when RMI is enabled via the kernel command line, so
> let's add it to the whitelist.

Are there issues with the touchpad when it works in the legacy (PS/2)
mode? I will be applying your patch, I just need to understand if it
needs to go into stable series, or we can just get it into 5.6 and later
versions.

Thanks!

-- 
Dmitry
