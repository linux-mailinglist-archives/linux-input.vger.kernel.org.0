Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89A337F5A5
	for <lists+linux-input@lfdr.de>; Thu, 13 May 2021 12:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhEMKfN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 May 2021 06:35:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:39870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231327AbhEMKfN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 May 2021 06:35:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2050610A0;
        Thu, 13 May 2021 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620902043;
        bh=BHLepAgGfImmzwIaKiKF/RrZZFhle8ozbvuz7BQi72Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=W1CAZbMWImG90ZPkIh8wA0skCXob3TZ451OTy2l2ccDJYHizSa8LOqZyqpJPDkyW/
         PWr/wGaDNwEXWXVy71qWVHG+RRexO98Bp6AHLPokn4el9pWYSakUt0vGQpI8HM3nBh
         9pFkEbWavPD+2Phh6ey9+8FepD5GlM9M+LZUv/P31nnepycV2rEIxLp8z/u31nP38b
         vuGQKSpvEre4elpGqS8GxQ92cUqx1EOY8fMe0HrbwFP3CrtcJh4Y5IVV736gFVP8fU
         rftWfVUiBLxgnsqg/2C9FQ7pyHt7Xs4KsRo4FZdXd0dQRd8XnnHrqCu/dnvb++2vY2
         8AxpwqJw1Jv4g==
Date:   Thu, 13 May 2021 12:34:00 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/3] HID: multitouch: Disable event reporting on suspend
 on the Asus T101HA touchpad
In-Reply-To: <20210306133716.453447-2-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2105131233500.28378@cbobk.fhfr.pm>
References: <20210306133716.453447-1-hdegoede@redhat.com> <20210306133716.453447-2-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 6 Mar 2021, Hans de Goede wrote:

> The Asus T101HA has a problem with spurious wakeups when the lid is
> closed, this is caused by the screen sitting so close to the touchpad
> that the touchpad ends up reporting touch events, causing these wakeups.
> 
> Add a quirk which disables event reporting on suspend when set, and
> enable this quirk for the Asus T101HA touchpad fixing the spurious
> wakeups, while still allowing the device to be woken by pressing a
> key on the keyboard (which is part of the same USB device).

This one also applied to for-5.13/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

