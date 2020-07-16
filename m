Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9995C222EF1
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 01:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGPXWc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jul 2020 19:22:32 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:57649 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726333AbgGPXWc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jul 2020 19:22:32 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 0627B4D2;
        Thu, 16 Jul 2020 19:22:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 16 Jul 2020 19:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=e
        O5wnOqn967+lYOqPz90HhGMsSqCqaDg8G6RLj5uCXg=; b=gubyzIFlq6PdX1cSq
        0cafcgf+OK7pIrOvCdbl4GQzbAdh+hxWNi8AFAhA5PXy5IXoWuPP8er/5vDbHNnC
        zXkOoskOdU+IgvDiyR4LfsLvR0LRQw1IsQOmJadiJAH6TxyXeIMSIwuGcTyqrDRo
        M5JM17szFcLxunyg0NUoO38LAwP+7U7DszdKObMbDuhccZu1FiZc7eJRe73ZeYHu
        7vRpXuENLvqAQK/FgfnsGz0WSXgX2ZvpE179fLgMJp0VPp/05/9ATjQm+FzDa+aV
        HDoRGSVnjZKkIpGaETaYbwFxtFdENygBUFMmk6T3W+xBbgQykYC/A0XRZXo+ABbY
        TeDkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=eO5wnOqn967+lYOqPz90HhGMsSqCqaDg8G6RLj5uC
        Xg=; b=g/GSmCwVcJjNJL5p1mR/w2WYilJTm/URGPkrIPECxPkF4N1aI8gzTLKp2
        +emvr8GoBTB9ePWjaNKN8igigAyN+mswa4MiLKkujm3U1YchwYtQbe5t/REuEHrG
        DYkAbd1ofcWFb7MTtnFo73Td38KGt/i732war8pukag1y6qwas5VxV5zcaN1ypmu
        UAMYvLOXF8yVjlSqHP+GZrniZIVvWnxtao2bOQ4lC2GbwOCvHVoP+ESS0E8C0f41
        k5JVAd7xxkM9a56FHo0yKaZeTeTIClEDxMwUDCfK/t8xp1zNv6y99EZxAqhIhNRx
        b1LbZNXfGahsRpmDW9DIGc/7GiC8w==
X-ME-Sender: <xms:NuEQX_M4L8Rk9gzgMhJYbhwbBtPT12wFf1pkx8tAlAzTIh_xA0DRhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeehgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhepgeeftedtgeefleffhfdvffffhfegleegjeeijeekkeet
    feetvdffhedtkeeiffejnecukfhppeduudejrddvtddrjedurdejfeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgv
    rhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:NuEQX5-tP3exUiLf2QNnVQE-DAHhCp3clKKKWilp2jIDpzvuI5TYkA>
    <xmx:NuEQX-QeDuSFL_dtTg3EFvffwYqxrDh0zWh-HXHRL6dKQowQcG56gw>
    <xmx:NuEQXztr10DKU_gA7OtIEWRWJs8h4TU1Y0iAqkfs1_PhNeY1Qlt8Eg>
    <xmx:NuEQX1pVyjTgiLjAUr2fv1VWyaYvrBHFulgSrZvfiInZgUddkL7dWQ>
Received: from koala (117-20-71-73.751447.bne.nbn.aussiebb.net [117.20.71.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id C036C30600A3;
        Thu, 16 Jul 2020 19:22:28 -0400 (EDT)
Date:   Fri, 17 Jul 2020 09:22:23 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        linux-input@vger.kernel.org
Subject: Re: No pinch events with Dell laptops and Alps
Message-ID: <20200716232223.GA527251@koala>
References: <8b4907c5-4af8-2a2c-bbe1-46b2be2980be@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b4907c5-4af8-2a2c-bbe1-46b2be2980be@molgen.mpg.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 16, 2020 at 03:19:32PM +0200, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On the Dell Latitude E7250 and Dell Precision 3340 I fail to get three
> finger pinch events generated needed for GNOME Shell gestures [1].
> 
> Debian Sid/unstable with Linux 5.7.6 is running on these systems.
> 
>     [    1.602394] input: AlpsPS/2 ALPS GlidePoint as
> /devices/platform/i8042/serio1/input/input2
> 
> I am only able to create swipe events. (Four finger swipe works to switch
> workspaces.)
> 
> ```
> $ sudo libinput debug-events
> […]
> -event1   DEVICE_ADDED     AlpsPS/2 ALPS GlidePoint          seat0 default
> group10 cap:pg  size 98x51mm tap(dl off) left scroll-nat scroll-2fg-edge
> dwt-on
> -event2   DEVICE_ADDED     DELL Wireless hotkeys             seat0 default
> group11 cap:k
> event1  - AlpsPS/2 ALPS GlidePoint: kernel bug: Wrong slot count (4),
> reducing to 2
> -event1   GESTURE_SWIPE_BEGIN +1.549s	3
>  event1   GESTURE_SWIPE_UPDATE +1.549s	3 -0.36/ 0.26 (-2.59/ 1.85
> unaccelerated)
> […]
> ```
> 
> Does the hardware and driver support that?

The device is an Alps GlidePoint which are usually INPUT_PROP_SEMI_MT. On
those devices, we don't support 3fg pinch gestures because we don't get
enough data to make the gestures reliable. There is no specific quirk for
your device otherwise, afaict.

If it's not semi-mt then it's too hard to say without more data, I'll need
at least the output from libinput record to figure out why (that recording
will contain the libinput version which also matters).

Cheers,
   Peter
