Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82C82F71AE
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 05:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbhAOEpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 23:45:18 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36109 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726032AbhAOEpR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 23:45:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 7CF975C00AE;
        Thu, 14 Jan 2021 23:44:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 14 Jan 2021 23:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=HddAvGpngy7gMAMoANW+9cHBGjv
        IshbqLk0/grNgfO4=; b=f1ayHlkTp6zhZkh/s/h43Koq7wd4JoK3+IVZAigx4Ae
        G3x4XHAb/4uiqz6Kn9DHJkFM74pARaqlMBS/z0bDTqGWHp2mQgbpldq2jEt8jr54
        zrHhr0eUFmBbE8sk9++0hgk6MDJCg+QET0hXYjKsBbswJInrClrHQwDKv0h7eroz
        8N5Gg/92K1blTFv1qO4lrzRqHK9PVQ4Yn+apQ0vmVofu9nRrkmaBnHX7uYGyQKyn
        sXe8YK4Nx77+05Es06e3j+jqDw+Bi6aWDUH/e7jejjA9ePX2l/zhBWDVYnfGXFxx
        AXv6TQqey7uKEq1wqXIONQo1XvQ3p7cnDYsvNlkwg8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HddAvG
        pngy7gMAMoANW+9cHBGjvIshbqLk0/grNgfO4=; b=ljoezSl2KpGUor+YfKT9IP
        X5BcxRVtqxXZGG+prpKLlHIY/X6Jt9TyBx8rsz+UBg8BexEeCHsAMMLs0+pmbUsZ
        1pMrbGKFWakn9MBuRSguNQVQEAmXyks/5LhPS1tmLgYmWLdGGHXwIguK1y5zveH7
        uCz7AwHFyQ2eXpVpdSVeZsJV6gJuXkkDbauo8E8BAAuYTZyHE3rQgfy7Op/kg3A/
        afmUUQgvgbFZmrEy7vZKirM8hbFz+T96tQk8wHUYiw+egLPcjCapdHRIB967RRhD
        OjsT+RjuA830G/cm5T+OmYEcGCpa2kmj/xOXLB/iDVsQAuiz9Okp4QjgcfDXHFww
        ==
X-ME-Sender: <xms:rx0BYBZMPtFobrdHP3sfWHMnLuX_9slhfqN2b9V8kkn0uC0ZSG4CBQ>
    <xme:rx0BYIZFIJA7o7l7Xt4of5mdJ96vtprc2akOjuKEdrhZJDDSURKnlcL9CvjOTJUQ0
    xf70_NqsbgSzjavOig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeehhfehfffgheelgeeuudelhefgvdefveekudevjeevjeev
    vefggefguddufeeuveenucfkphepuddujedrvddtrdejuddrjeefnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghr
    vghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:rx0BYD9WHJ8bYi1BVyRdd5L3WDQ1OR4ziIh9cgk-eVC3T_SLMFqZCg>
    <xmx:rx0BYPq-hJ1fHkUKgf6UW29Va5XgY7W9viOYyq-GasFDAcI6yNXoVw>
    <xmx:rx0BYMqw1WvDKyWwMdqe-w6FqFzQJhLP7pmqr0kI3BCIfDU3am4fvA>
    <xmx:rx0BYHW6XkoanXZs0xaMB6mkTunYLgjWIpSimcO_T6r71g1jkw5qjw>
Received: from koala (117-20-71-73.751447.bne.nbn.aussiebb.net [117.20.71.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 34ADB1080057;
        Thu, 14 Jan 2021 23:44:28 -0500 (EST)
Date:   Fri, 15 Jan 2021 14:44:25 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        seobrien@chromium.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-input: avoid splitting keyboard, system and
 consumer controls
Message-ID: <20210115044425.GA1395024@koala>
References: <X//jjawwbm8FxbQU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X//jjawwbm8FxbQU@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 13, 2021 at 10:24:13PM -0800, Dmitry Torokhov wrote:
> A typical USB keyboard usually splits its keys into several reports:
> 
> - one for the basic alphanumeric keys, modifier keys, F<n> keys, six pack
>   keys and keypad. This report's application is normally listed as
>   GenericDesktop.Keyboard
> - a GenericDesktop.SystemControl report for the system control keys, such
>   as power and sleep
> - Consumer.ConsumerControl report for multimedia (forward, rewind,
>   play/pause, mute, etc) and other extended keys.
> - additional output, vendor specific, and feature reports
> 
> Splitting each report into a separate input device is wasteful and even
> hurts userspace as it makes it harder to determine the true capabilities
> (set of available keys) of a keyboard, so let's adjust application
> matching to merge system control and consumer control reports with
> keyboard report, if one has already been processed.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Peter Hutterer <peter.hutterer@who-t.net>

I think, let's see if there's any fallout from that :)

Cheers,
   Peter
