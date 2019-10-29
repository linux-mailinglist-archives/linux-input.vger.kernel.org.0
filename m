Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6C2E7F0A
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 05:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbfJ2EPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 00:15:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41129 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbfJ2EPV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 00:15:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id p26so4428111pfq.8;
        Mon, 28 Oct 2019 21:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qIDdA9X0WLHYmvMMfU04BjScbjP58X4CNbduUQFyWDU=;
        b=isEoAFkAFr9mNWbL9TkpQ26vA2bO0gAwBibIllTAzPH1HFa9W1mDsosBtMIP36RQt4
         vwmXAyd3Ub8rgW6Gp7a4TQkFfbYxLi2v3eatycdlWwC7nj/yFWvieRsr8KMJxHB34UfV
         ifNWKjuVp5vijWTjO1kxnt7D9uOtbrXZnUf/yKPxeewaDk7Tfzg/XJuAjD9w9X3YlllO
         xXRV5gC7AW0Y8/UYA+j29EpfHrosEGiDz5S6Lb5tIsMpD2iR1qCII+EPZfJOTivhhPm2
         vBvBnPnOn0j16RoVTlXWiulPePLYGiN/fOtyw7MIsGMrsVBx4pThJBDjKmuR81ypeQOA
         F8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qIDdA9X0WLHYmvMMfU04BjScbjP58X4CNbduUQFyWDU=;
        b=Xxq8SKsSWeRPr+MQ66nVG3FixUZlMyGAHXkHkuQv/d23d+pjkq1AYKnyxxgPxKvEj6
         +tuNabNXD2OnMyUYTCtHWpozuRMACSXmum2LwXyXL7SAwEDJ31ngB3gOcjk2Y/pJoi5n
         uBVYWLEI1GT8gOfleA+ED12RFFUDScFWiT0LNIUaNw3a3L3pHVulfoMOqYfo1iW5QmCn
         FY3ek6dELK7mXv36TO6vTF2GthLcFz5vXsnTtRC+fAjEmONsm9CDUpxHLayaYQ0676YK
         kJQqTOOUsaMZ4P5EzZ/Suu1P2WLdbj0ukN3nLq5LN+h2UMsSxHqoQg5BQvxEU1Qyyz/P
         5X8w==
X-Gm-Message-State: APjAAAUheILT5AyehwJpWITX2PN45mby0fwHWjhIwMLUIFnQTD1hluMw
        uzgUQQieKLIu8ATRC23448M=
X-Google-Smtp-Source: APXvYqxu2Nxxme/n4W6QvLay3PR21FaAPSpZh659xTZIxYXiTzJfPOc+2YGd4GH7Jjc+GuHAsiz4cA==
X-Received: by 2002:a17:90a:a891:: with SMTP id h17mr3674995pjq.32.1572322519869;
        Mon, 28 Oct 2019 21:15:19 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id bb15sm954517pjb.22.2019.10.28.21.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 21:15:19 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:15:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add touchscreen support for TBS A711 Tablet
Message-ID: <20191029041516.GE57214@dtor-ws>
References: <20191029005806.3577376-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029005806.3577376-1-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 29, 2019 at 01:58:03AM +0100, Ondrej Jirman wrote:
> This is a resurrection of https://lkml.org/lkml/2018/7/25/143
> 
> Compared to v4 of Mylène's series I've dropped all attempts to
> power off the chip during suspend. This patch just enables the
> regulator during probe and disables it on driver rmmod.
> 
> I've tested the driver with suspend/resume and touching the
> panel resumes my soc.

OK, I guess we can revisit when someone really needs power savings in
suspend...

I folded bindings into the driver change and applied, dts changes should
go through respective tree.

Thanks.

-- 
Dmitry
