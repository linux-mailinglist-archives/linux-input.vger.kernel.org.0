Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F97C4331EE
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 11:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbhJSJQV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 05:16:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:58664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231652AbhJSJQS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 05:16:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D46D60FF2;
        Tue, 19 Oct 2021 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634634845;
        bh=VonkQPxD2EClx47Gjhc0Bn3qQyqcWb0xi/s1DTRLUWU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Nfjjm+MuP5iT5uyFnuWMWlE87kHvKHHAu3+SQWLKVsQNJ469n1po+kk04Li8HURsX
         KtgrZvt+5G4ag2ha7w6Yb2Fxf48j1fU58KrwnGurLP7IMbxd5HJn8fYBpVLmRV26Et
         t9oTCY6JAZMOuOfWnZAwFpg/cfIdHqiAAmiaOXiPS9vY+AIdWDYxezzPBPXy5ZsZHR
         mkU3w9D9MN2br1NvtCreprRIVRxQQnSuiWDzwtlCzPQ3RCh7SbQIMmrofwKFReGSXy
         Bb736FK8zQ+dYzldHBUW8XRc4FDPRMctBgIhWu59MvqsFnfzyC5IEjS8Hbj1UC428U
         r5+Vh8gghbgLw==
Date:   Tue, 19 Oct 2021 11:14:02 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
cc:     linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.ne@posteo.net>,
        =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: Re: [PATCH v3 0/4] HID: wiiu-drc: Add a driver for the Wii U
 gamepad
In-Reply-To: <20210921150837.ingexwsauvxgluca@luna>
Message-ID: <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr> <20210519085924.1636-1-linkmauve@linkmauve.fr> <20210921150837.ingexwsauvxgluca@luna>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 21 Sep 2021, Emmanuel Gil Peyrot wrote:

> > This driver is for the DRC (wireless gamepad) when plugged to the DRH of
> > the Wii U, a chip exposing it as a USB device.
> 
> Hi, I’d like to request a review on this series.  I’ve been using it
> with success for quite some months, and from a self-review after not
> having touched it for as long it still looks correct. :)
> 
> Thanks!

[ CCing Daniel ]

Thanks for the patch, and sorry for the delay in the review.

The code looks good to me, the only question/request I'd have is -- would 
it be possible to adhere to the driver naming standards, and actually 
incorporate the support to existing hid-nintendo driver? Or is there any 
substantial reason which I don't see why this wouldn't be a good idea?

Thanks,

-- 
Jiri Kosina
SUSE Labs

