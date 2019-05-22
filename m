Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 549FD25EBD
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 09:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbfEVHke (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 03:40:34 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:52256 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbfEVHke (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 03:40:34 -0400
Received: by mail-wm1-f52.google.com with SMTP id y3so1071814wmm.2;
        Wed, 22 May 2019 00:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fP/xQRsi0wUvGZJuEoRkxJCES8p4BjwCn5vkAc/0qvQ=;
        b=Nxg2iL2sLiJ6O0dBB/uqiOcVJD+11Z0PGIxMzIzLP0VhyOjpIVVLmMuh3rp7nSVTIy
         Dz6DaaRdVk9mqpCJFeW5k1YKJWXONbCprULtovWkAS8qENu8yM3WzqKjvClr6YX1W8MX
         +7viV4IXF262bRbbV7Qactw40K7ILDPErH11kli5anIRWN0U0tX/Fw+6W3DcgMgLL3DN
         erFtdzFLkrrckOkA+yBbdHKqTj9yD7R7DNthaUCUohQbcgERF7YNsv2LHn1Ot3tZxj89
         K1STt2tsE5DEU/pjeAVNCuGHOEHhfDgvlgvguZ2VU3BkSuj0Mhuw/E8D7q4g/floBchG
         cUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fP/xQRsi0wUvGZJuEoRkxJCES8p4BjwCn5vkAc/0qvQ=;
        b=CfJkYTlGaa4zox9ZHQZdocEJrIHL2RsKAY4BVb59dtK3xWvawyN0yYT0Q+f6wff8eU
         pd3GdASYS9FuJJ8R9tZo5YR0KzEmZVXHRkbbJWf58TJeyt7e1xVjGMmfUIaRjsxuCspD
         UFyeBHdW5BLYlAjdpvzqi9zUiwZ49v6tNvBvd6zdlhMGRnTMwhCsUTLgNSjce/5FB6is
         g4EJOJmt1na0GM2ox3wMWnzxyHWljW2BxcvA0aScSNg4KxQxMCOpUMxtHFwI7KOeYrlc
         VNquONa1HDbzhyabpsHbDka4tt9Jegx9ZFyGyoW1Hq/fKrsHYc/CW73ZX0wOiA6IVlsJ
         6yNg==
X-Gm-Message-State: APjAAAX4wl/7ao6s1pzjEyrkJQjvQjcvfoJj2yNMsnU0M7Gkh104bKZP
        /5/1oiDGA58fxlKmpjMTFkE=
X-Google-Smtp-Source: APXvYqxTwAkd6e2sxFdxRvQ43q9hTQ2zc3iokSgY1vt98iEUUiDSwm4j0t24rhv8i+ggFEcScdmkGA==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr6505599wmc.17.1558510831925;
        Wed, 22 May 2019 00:40:31 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id m16sm867227wrb.5.2019.05.22.00.40.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 00:40:31 -0700 (PDT)
Date:   Wed, 22 May 2019 09:40:30 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        dmitry.torokhov@gmail.com
Cc:     Hui Wang <hui.wang@canonical.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbUEFUQ0hdIGlucHV0?= =?utf-8?Q?=3A?= alps-fix the issue the
 special alps trackpoint do not work.
Message-ID: <20190522074030.64sy7xt3wnomtxjb@pali>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
 <20190521094622.syeub6tcqhbyc7sg@pali>
 <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
> Hi Pali,
> 
> Ok, and cannot you set ALPS_DUALPOINT flag based on that
> alps_check_is_trackpoint() result and then update
> alps_process_packet_ss4_v3() code to supports also
> V8 trackpoint packets?
> --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
>       Then we choose the standard mouse driver.

Mouse speed is something which is configurable. Have you configured it
somehow? Also there is libinput project should handle these settings
more properly.

Adding Peter Hutterer, maintainer of libinput to loop. I think he could
help with this problem.

I do not think it is a good idea to force back to generic PS/2 mouse
driver for touchpads and trackpoints. Native drivers for touchpads and
trackpoints supports multitouch, absolute reporting and lot of other
things... Also calculation of mouse speed from absolute positions on
touchpads can be more easily fixed as from emulated relative movements.

Dmitry, what is your opinion about this problem? What should psmouse.ko
do in this situation? Disallow usage of absolute mode and force bare
PS/2 relative mode?

-- 
Pali Rohár
pali.rohar@gmail.com
