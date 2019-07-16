Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DE16B762
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 09:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfGQHlf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 03:41:35 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44675 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQHlf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 03:41:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so10800136lfm.11;
        Wed, 17 Jul 2019 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UDTiA5ZV4BOkWfIaoiGqRPxv70w39FgCn9HjMkrGdk4=;
        b=b97jjQBijQGkS3I8JrF5n/rwPkZAi+d1hrMRNd6378lx90/LreoBaBxbCNS+JGyOs4
         cVW8JIBRROnTv5nFdLYY5Yg4GVxh4C7okAAdy3vZY355Yz4qvbHhxMFJWfbRBoiNWAYo
         8W6ohuN1v8iMmgiEO/ZBq3Yt1KiJSRDN4mzad5kSK4fG3isOSAM3wLrcOnnTDyTf/pmr
         y6zWzEkkFttYuuNR7aktUmNeL/Yf6KpIZrriyE5aVOTAaMzzGkNfQWKDtNmNetqtGiD2
         f3tpk8NmD4ecTGmKOHu/Ght+H6o+DkZdHIxZwg2ZqkX5S4q3hSv00qtZpDpuEvKW4i1D
         vF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UDTiA5ZV4BOkWfIaoiGqRPxv70w39FgCn9HjMkrGdk4=;
        b=k3UuWuSzIzxWAhklJmFUsET5EW5ljlWv+gAJVvVSznISZd108QnQxm+GCwLMcNBrKo
         fDVLdjqikHw7Lzwr3s8OMxozxmHPAFQWuKKdTTiCIUwQwN1LR7GB/9i6Dul8NDiYyYxp
         CzSuijlqOy5z+aL3wJcIRO39nuczXRW3cRmW4+rIkdlKolybC0kDLAl5/8hdW24cDi1/
         06JGs2MVwSyGE9GJTTtYbYd3zcvnwkHoXACkYv1AHFQWXnvcIh6C8UfSVurwwcNvSQMg
         xeW63jTr0x/5JXlfoCDYHB5Hno20LsuOdcXrPgWXHvk18eiZkSv/Mdlb/leKabv/n0qO
         MPFA==
X-Gm-Message-State: APjAAAVmU2SpfiZxNBRauqgpYIed1LENVLHTTDm04BOfghabQPuUzJv+
        tQ+Jt53K2WHR+WNJ2ADL9kKFYC5jPus=
X-Google-Smtp-Source: APXvYqxwnUOtoANFhRaDvYDRDDdkinPxmIOjZiYKK9RDYvL3mgH1A7RBDg4bECpQBEPt0IKnr1AeXA==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr16144635lfm.54.1563349292544;
        Wed, 17 Jul 2019 00:41:32 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id r17sm4311107ljc.85.2019.07.17.00.41.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 00:41:31 -0700 (PDT)
Date:   Tue, 16 Jul 2019 22:18:07 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2 2/2] input: soc_button_array for newer surface devices
Message-ID: <20190716201807.GA584@penguin>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-3-luzmaximilian@gmail.com>
 <20190716072135.GA806@penguin>
 <92e13b01-7353-1430-fb38-b5098d509da2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92e13b01-7353-1430-fb38-b5098d509da2@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 16, 2019 at 08:19:04PM +0200, Maximilian Luz wrote:
> 
> Hi,
> 
> On 7/16/19 9:21 AM, Dmitry Torokhov wrote:
> > When you are saying that Pro 4 and later models use different
> > notifications, does this mean that Pro 4 does not define any GPIOs?
> 
> Unfortunately, at least the Surface Book (first generation, buttons are
> handled the same way as on the Pro 4) has GPIOs defined in MSHW0040, but
> they are for different use. Specifically: They can detect if the
> clipboard (screen part of the device, the device basically has two parts
> that can be separated: clipboard and base) is being removed. Relying on
> the GPIOs was my first idea too, but that has been reported to shut down
> the Book 1 when the clipboard is detached.
> 
> As far as I know, the OEM platform revision check is the easiest way to
> differentiate between those devices.

OK, fair enough. By the way, I see you are adding some #ifdef
CONFIG_ACPI and stubbing out new functions, but the driver does not
really work without ACPI (acpi_match_device() will fail in this case I
would think and that will cause probe() to abort). So maybe we just add
depends on ACPI to the driver's Kconfig entry?

Thanks.

-- 
Dmitry
