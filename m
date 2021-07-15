Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB0F3CAB8D
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245289AbhGOTUk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245715AbhGOTUC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:20:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0A036117A;
        Thu, 15 Jul 2021 19:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626376628;
        bh=hS5dc8HwWvdslOHZlxfxyHSIuTlPbSDryagK8XGAIiQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IajqWFjYuTj5E18TJLlosqAymtDQav9WUZgytkNqD7lEiE7jEYPBiYOZiuN4KnSj1
         UNVqSih/M/w29sOdOusfnGBH2hbb+dm5+lfthDaYE6lUrJvmT+SpNdnSdIQmho0tZ4
         CSUl1JkoQKswZmvoQEtXdG3Fh8x1Al/cYO+q6xw1LSgNllsO3Ul1bpTNE2WrgybnBA
         dOMdl380JW2sSeI0COzw7uXBsXb0Gl6ku8/B7upWA7H+aI45fEGru20eIjTdIw86He
         eGuMyv8mrXjR1siTEQ+DfdyVlJFFQcTKUAAdTKtL0CiQHYP+o/0z1iEZBhGvVT700x
         yXR9dZD8moaZw==
Date:   Thu, 15 Jul 2021 21:17:05 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: magicmouse: enable high-resolution scroll
In-Reply-To: <20210707155822.7811-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2107152116510.8253@cbobk.fhfr.pm>
References: <20210707155822.7811-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 7 Jul 2021, José Expósito wrote:

> The Magic Mouse, generations 1 and 2, doesn't have a physical scroll
> wheel, instead, the REL_WHEEL and REL_HWHEEL events are emulated
> when sliding a finger on the surface of the mouse.
> However, the smooth movement of the finger is transformed into a step
> based scroll on the screen, leading to a suboptimal user experience.
> 
> Emulate high-resolution scroll by sending REL_WHEEL_HI_RES and
> REL_HWHEEL_HI_RES events so the scroll on the screen is closer to the
> finger movement.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

I have queued the series for 5.15. Thanks José,

-- 
Jiri Kosina
SUSE Labs

