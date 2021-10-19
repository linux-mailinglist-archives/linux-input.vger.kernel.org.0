Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8D64331AD
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 11:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhJSJCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 05:02:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:53360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhJSJCm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 05:02:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D197E6115A;
        Tue, 19 Oct 2021 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634634030;
        bh=HwE5rkhq5RyQybWxHWFW6O5vJvFRdBTg/Qnj+51O1uo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=tqr1keVrJitobWaL+xEx439w8zuk3iEkRQVXsR69zDO6DgcLZO7yEYClW11MuMqVI
         eSDpcZ5WXcEjyIfwg36x7pCgocCc+5lMix+RD7ORrccou5SN08Dl4FEAAwbep2VBSw
         ethDAjHO+ZfCjN/B/lkMjV370DcMMDARGLDIKpfu5mn0XJ7kw6KY36qCBQVNGkN5Tl
         564uppR7Fbq3F2eaRqGdc/epGIU8Dg+K9n028JIUeneM/pUv28FceMRpxs9Tp5ITSf
         Ay/QVbqyvNt1d5JGjNzMzfSzloavivEUpXbhSfff4BueMJGLe3tEnx2Ynr2iPWG52H
         hB8kFc1AMTBmw==
Date:   Tue, 19 Oct 2021 11:00:26 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alex Henrie <alexhenrie24@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        hadess@hadess.net, jose.exposito89@gmail.com, jslaby@suse.cz,
        juw@posteo.de, lukas@wunner.de
Subject: Re: [PATCH 1/3] HID: apple: Rename MAGIC_KEYBOARD_ANSI to
 MAGIC_KEYBOARD_2015
In-Reply-To: <20211008073702.5761-1-alexhenrie24@gmail.com>
Message-ID: <nycvar.YFH.7.76.2110191100081.12554@cbobk.fhfr.pm>
References: <20211008073702.5761-1-alexhenrie24@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 8 Oct 2021, Alex Henrie wrote:

> The ANSI, ISO, and JIS variants of this keyboard all have the same
> product ID.

The series (with v3 of 3/3) is now in hid.git#for-5.16/apple.

Thanks,

-- 
Jiri Kosina
SUSE Labs

