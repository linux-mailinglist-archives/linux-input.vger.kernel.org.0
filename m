Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143AE2C6818
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 15:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbgK0Op0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 09:45:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:33408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730767AbgK0OpZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 09:45:25 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B15D20B1F;
        Fri, 27 Nov 2020 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606488325;
        bh=y7jXTZIRzQqX/J9cLU7WdF4pVoRwYLj9k+IGbopwTgU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=iDNyW8YpOY7HIDoV59M+tQqsg0kkEf/xg63oNvDaISs1m3gDWS0v22NLEhqraPQTB
         KO48dkMl4OTy6eF6Z5lYUaW8vkHPBFPzXEeVRLu7m64hzqDy5lK66Tlj4DikMd5Gks
         8TRze8XWZaBDr+iZZML3ZGMBlBIfKzKkd5dOY1RE=
Date:   Fri, 27 Nov 2020 15:45:22 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dean Camera <dean@fourwalledcubicle.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [V3, PATCH] Increase HID maximum packet size to 16KB.
In-Reply-To: <20201125223934.5861-1-dean@fourwalledcubicle.com>
Message-ID: <nycvar.YFH.7.76.2011271544480.3441@cbobk.fhfr.pm>
References: <20201125223934.5861-1-dean@fourwalledcubicle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 26 Nov 2020, Dean Camera wrote:

> Currently the maximum HID report size which can be buffered by the
> kernel is 8KB. This is sufficient for the vast majority of HID
> devices on the market, as most HID reports are fairly small.
> 
> However, some unusual devices such as the Elgate Stream Deck exist
> which use a report size slightly over 8KB for the image data that
> is sent to the device. Reports these large cannot be buffered by
> the regular HID subsystem currently, thus the only way to use such
> device is to bypass the HID subsystem entirely.
> 
> This increases the maximum HID report size to 16KB, which should
> cover all sanely designed HID devices.

Seeing the evolution of this constant over the course of years really 
reminds me of "640KB should be enough for everybody" :)

Applied, thanks Dean.

-- 
Jiri Kosina
SUSE Labs

