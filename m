Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7EE457135
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 15:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhKSO4p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 09:56:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:45542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230373AbhKSO4p (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 09:56:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5937615E2;
        Fri, 19 Nov 2021 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637333623;
        bh=zm47Q8trJHAuUeBklzQpMUYVcMUm+1qCiv/Awmv/gQM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nqAZS4jW3TtMRGrIe53j+VFXRL349hQnkPB0dGe/x2IvkbaQg9w7gWYnyQqKYYTkl
         ygUqMEQ5fxjKuZQs4wur/aBY5vAXA4/mbkOQZqpVhBazw+DEu1JCVZHNGpjfKMp2bj
         ZshuduJo9DjtOxDHSIZZ531Af4yhDo6QHybMgS6RqLr+8za3WNTDvcLDu0VzmRXlZO
         G66kal4D+EJH9P4Pw0lVTFYqsK3Qr6RqFwZ3QnsvyD3XtX3rAFQ1uT/gJGswx/H+j5
         gqPH8NBmkjIj4pV/FAgty/oM7wn8r7zRTqMKi9fQojErxZ4QtrIDGLQaEk8WETPl/+
         8Z8bvmvga1eew==
Date:   Fri, 19 Nov 2021 15:53:39 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Vihas Mak <makvihas@gmail.com>
cc:     benjamin.tissoires@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: thrustmaster: fix sparse warnings
In-Reply-To: <20211113200448.GA1111164@makvihas>
Message-ID: <nycvar.YFH.7.76.2111191553330.16505@cbobk.fhfr.pm>
References: <20211113200448.GA1111164@makvihas>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 14 Nov 2021, Vihas Mak wrote:

> Changed 0 to NULL to fix following sparse warnings:
> 
>     drivers/hid/hid-thrustmaster.c:208:43: warning: Using plain integer as NULL pointer
>     drivers/hid/hid-thrustmaster.c:241:17: warning: Using plain integer as NULL pointer
>     drivers/hid/hid-thrustmaster.c:275:37: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Vihas Mak <makvihas@gmail.com>

Applied.

-- 
Jiri Kosina
SUSE Labs

