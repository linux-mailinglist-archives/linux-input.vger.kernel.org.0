Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487171BE78F
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 21:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgD2Tpa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Apr 2020 15:45:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgD2Tpa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Apr 2020 15:45:30 -0400
Received: from pobox.suse.cz (unknown [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F70C206B8;
        Wed, 29 Apr 2020 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588189530;
        bh=wX/19Jsd3N7TN0rYMzq53H+g5FGfskexyD7KfL2ugN8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=FIzj6h7wVJhM2hCXN9W50KI5kI6JRhnfcjgs4vRhV2OMAdqsBYqnimiL7jWZvedsf
         Mkl4yP9mBeetjk/Z9FhErayDw2bXWo3pTgcmYRoFvIewzI0YDtjXgTNyyFcBzXpFAJ
         cmWXsU3juIm4DSqJsXfQz59wZoP2BtQ5HVPYRRhQ=
Date:   Wed, 29 Apr 2020 21:45:27 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: reset Synaptics SYNA2393 on resume
In-Reply-To: <20200425105817.27084-1-daniel.playfair.cal@gmail.com>
Message-ID: <nycvar.YFH.7.76.2004292145170.19713@cbobk.fhfr.pm>
References: <20200425105817.27084-1-daniel.playfair.cal@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 25 Apr 2020, Daniel Playfair Cal wrote:

> On the Dell XPS 9570, the Synaptics SYNA2393 touchpad generates spurious
> interrupts after resuming from suspend until it receives some input or
> is reset. Add it to the quirk I2C_HID_QUIRK_RESET_ON_RESUME so that it
> is reset when resuming from suspend.
> 
> More information about the bug can be found in this mailing list
> discussion: https://www.spinics.net/lists/linux-input/msg59530.html
> 
> Signed-off-by: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>

Applied, thanks Daniel.

-- 
Jiri Kosina
SUSE Labs

