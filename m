Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 429326BC72
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 14:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfGQMhb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 08:37:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfGQMhb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 08:37:31 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DD1D205F4;
        Wed, 17 Jul 2019 12:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563367050;
        bh=DtF7khRy7ZZV1LIIYgT7F5tDB7R2ZPbNPPAeoEenN2o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Dr81L6uJKllBYXEbc/dYgxmkcrW/SJjygT4L7oUfjoHMabqx6nUrbXdgKPMFusKsr
         03tSF03LV23Ui6dJjg3z490MjYW1duwjoYV23ZTIr2Ew3fPTWJS7YWEEya15uSVJyF
         JtH8dq2Q/2ARQo5K51BY7sj0nTZyrFeN2ogwiee0=
Date:   Wed, 17 Jul 2019 14:37:20 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ilya Trukhanov <lahvuun@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2] HID: Add 044f:b320 ThrustMaster, Inc. 2 in 1 DT
In-Reply-To: <20190702103716.qhiq6lgef4jzqpde@lahvuun.homenetwork>
Message-ID: <nycvar.YFH.7.76.1907171435190.5899@cbobk.fhfr.pm>
References: <20190702103716.qhiq6lgef4jzqpde@lahvuun.homenetwork>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2 Jul 2019, Ilya Trukhanov wrote:

> Enable force feedback for the Thrustmaster Dual Trigger 2 in 1 Rumble Force
> gamepad. Compared to other Thrustmaster devices, left and right rumble
> motors here are swapped.
> 
> Signed-off-by: Ilya Trukhanov <lahvuun@gmail.com>
> ---
> Changes since v1:
> - Drop PID entry from drivers/hid/hid-quirks.c
> - Use local #define for the PID in drivers/hid/hid-tmff.c

Applied, thanks Ilya.

-- 
Jiri Kosina
SUSE Labs

