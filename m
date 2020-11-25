Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482582C40EE
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgKYNMu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 08:12:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:53354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbgKYNMu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:12:50 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA6C4206E5;
        Wed, 25 Nov 2020 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606309969;
        bh=8c+tXMwztOWnQzr0BaFywkoj1p2WDtG71rSdUXCvw5Q=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=jdzA18QXi4CVT0hO6KFl84pIwy/tfE66p9ivK60Pmauu5PfpWSoLIk6MTPbQTnnFX
         m7UFQVpj/NU2kOUx3Sn000K2iaETRvchEFil5jm9kiBEVR6zYbNqH/GLvbIrrCFyM6
         aDxyr0Po1P1FG83yNzM+kXs97YFGcFOSCQdn8LOA=
Date:   Wed, 25 Nov 2020 14:12:46 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dean Camera <dean@fourwalledcubicle.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] Increase HID_MAX_BUFFER_SIZE to 8KB to support
 additional, devices.
In-Reply-To: <acdda6f0-3675-7e8b-b57c-711fe8199ce9@fourwalledcubicle.com>
Message-ID: <nycvar.YFH.7.76.2011251412230.3441@cbobk.fhfr.pm>
References: <acdda6f0-3675-7e8b-b57c-711fe8199ce9@fourwalledcubicle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 18 Nov 2020, Dean Camera wrote:

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
> 
> Signed-off-by: Dean Camera <dean@fourwalledcubicle.com>

Dean,

thanks for the patch.

It has been whitespace-damaged by your mail client though. Could you 
please fix that and resubmit?

-- 
Jiri Kosina
SUSE Labs

