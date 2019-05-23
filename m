Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F43F275D6
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2019 08:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfEWGCE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 02:02:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45513 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726081AbfEWGCE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 02:02:04 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E02732839F;
        Thu, 23 May 2019 02:02:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 23 May 2019 02:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=L
        csOEVamQy2pc64GAfEQRhVRNjB43ljzJOtJYgn4nCA=; b=aEXqDhR0dur6J6hfj
        bXOS73z54KRCysXrk6vlu04AEFk6xFyOdQU78ZFZ4Xx/uSlWEAvrg/RWQR8smbj4
        UymlqRv8mrJ49PjFZxQ95NctR8JlUCSOXy3Z5BmtSnSzH8ExRVCAGlLNwnHxeFkg
        E4AqLJw4dXSBbYU+7NincZ0ME2XQhMs7ZuHC53TVUooboQJlM1MR5fp7G8OZl3FS
        VdrB0OexJinEdZzDaOfCi+l9Yj9jH20tenCP1421lCOHDkdKA4vfn2OiF4mcgP6C
        JpTqeJawNNc2/X07CShqxSAJbyPdXYdIzrmUE+XA2eWnm3O7JCtihfckHAYs91te
        qvUyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=LcsOEVamQy2pc64GAfEQRhVRNjB43ljzJOtJYgn4n
        CA=; b=hhDRWbwmltxkSqEcdU6S7Ogwr9Zx4r40+97zVAJzDtc/63aEFAb+xrPtN
        40P3U9gFxEGb9bzMUN3ys9yxUSMK7V/3IMCl0CR/PqbI5IZSwsqPUTAYXW1XJA3I
        b+SPy/4V8Np4cc95Se7/0k21HepYQMZL++n3jCydfgwPhTuLD0kBmNSrx5DLGYyq
        vLiYpsXZlLeHhYgSLJEGHve5DMp90SVR4w2yQ3k15i+iszBDxM5/rXFWaKDoRND8
        Bc8XhfYYoySHWQD/Pmml9W5Ux5KXa4JCzr9B0Z8HxFPE1cjdMX7ma8W+Iu3B90WP
        mLl6l/xmb/H1MbghkLIcd6jX6w2mQ==
X-ME-Sender: <xms:WTfmXK9mcDtK85sxQHb0Y6i_0NS-j2orAAQ7BHHE30Sc7kBm3iauZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddufedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjfgesthekredttderudenucfhrhhomheprfgv
    thgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrd
    hnvghtqeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepuddu
    jedrvddtrdeiledrudegvdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhh
    huthhtvghrvghrseifhhhoqdhtrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:WjfmXE3EQRl9PQGpSfGN8VQOw5Tx5fHdd3yHFmz4iAbG_6-E8j4iHQ>
    <xmx:WjfmXFBMrKZ-DlWaF_VdrPUmen2t6WK12PWnEBAJtDkT6QpfstHK1w>
    <xmx:WjfmXGlp8YQUPL-gDmjqVz4aeBA75zXdWl6Rs8sVxrjTKf-_ZeiXDA>
    <xmx:WjfmXP_EvbjF-mzkphsDa8e-Ugcva8mli4FwFZZNlRk6MqYKjwyZow>
Received: from jelly (117-20-69-142.751445.bne.nbn.aussiebb.net [117.20.69.142])
        by mail.messagingengine.com (Postfix) with ESMTPA id D02DD380085;
        Thu, 23 May 2019 02:01:58 -0400 (EDT)
Date:   Thu, 23 May 2019 16:01:54 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        dmitry.torokhov@gmail.com, Hui Wang <hui.wang@canonical.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbUEFUQ0hdIGlucHV0?= =?utf-8?Q?=3A?= alps-fix the issue the
 special alps trackpoint do not work.
Message-ID: <20190523060154.GA10526@jelly>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
 <20190521094622.syeub6tcqhbyc7sg@pali>
 <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190522074030.64sy7xt3wnomtxjb@pali>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 22, 2019 at 09:40:30AM +0200, Pali Rohár wrote:
> On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
> > Hi Pali,
> > 
> > Ok, and cannot you set ALPS_DUALPOINT flag based on that
> > alps_check_is_trackpoint() result and then update
> > alps_process_packet_ss4_v3() code to supports also
> > V8 trackpoint packets?
> > --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
> >       Then we choose the standard mouse driver.
> 
> Mouse speed is something which is configurable. Have you configured it
> somehow? Also there is libinput project should handle these settings
> more properly.
> 
> Adding Peter Hutterer, maintainer of libinput to loop. I think he could
> help with this problem.

libinput has a quirk for a magic multiplier on trackpoints. it was the only
solution I found that came close to "working" given that every device seems
to provide some other random magic data. Doc for it is here:
https://wayland.freedesktop.org/libinput/doc/latest/trackpoint-configuration.html

There are also different speeds depending on which xorg driver you'd use (or
libinput/Wayland), so a "mouse speed is not ideal" is almost a guarantee,
given a large enough variety of setups :) That's why we have the speed
toggle, but I'm happy to hear any suggestions on how to make the trackpoint
more useful (in libinput anyway).

> I do not think it is a good idea to force back to generic PS/2 mouse
> driver for touchpads and trackpoints. Native drivers for touchpads and
> trackpoints supports multitouch, absolute reporting and lot of other
> things... Also calculation of mouse speed from absolute positions on
> touchpads can be more easily fixed as from emulated relative movements.

Yeah, agree. Using PS/2 mouse drivers means you lose *all* the extra
features touchpads have like palm detection, tapping, scrolling, gestures,
etc.

Cheers,
   Peter

> 
> Dmitry, what is your opinion about this problem? What should psmouse.ko
> do in this situation? Disallow usage of absolute mode and force bare
> PS/2 relative mode?

