Return-Path: <linux-input+bounces-154-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00D7F27A3
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9869A282882
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399211EA85;
	Tue, 21 Nov 2023 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrknFc+I"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6B1EA71
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D641C433C7;
	Tue, 21 Nov 2023 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700555898;
	bh=Kckxn2dpuJlfOLKIszq5fxog134k18RqxIJEdyu+KLw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UrknFc+IQ3iJYqNeOXs+OUPGBMqIhsZAz4rxBNRWl+wmhaoS+I0yppSohJ6z/Xd8s
	 +IOMgVWY70NIEbMZnfSwQlLwHwcKvkoy5qT4a+SIL9tLUZYwXuaQ5mqe6y6RqFBM7J
	 9nVKbgleFEkdxGohZ1BUaYur8Oqe6wAYD0JgLUfm6uIOfaBcXH6PAzzFcIbzuRwag0
	 NhJj2xsBhLpHy0IGS0qmKGfuWmEJqKZlbXzKHCM6V+HzkgAO3hUVeVVvUJZ3mppqvk
	 GmwbhKT2kahntQGLj6EiV016f6QctgqYyipBgGajNt59QrjQOeViq1GVLRSozsBAp3
	 mnbGPACNauJ7w==
Date: Tue, 21 Nov 2023 09:38:16 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Brett Raye <braye@fastmail.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: glorious: fix Glorious Model I HID report
In-Reply-To: <20231103011038.27462-1-braye@fastmail.com>
Message-ID: <nycvar.YFH.7.76.2311210938070.29220@cbobk.fhfr.pm>
References: <20231103011038.27462-1-braye@fastmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Nov 2023, Brett Raye wrote:

> The Glorious Model I mouse has a buggy HID report descriptor for its
> keyboard endpoint (used for programmable buttons). For report ID 2, there
> is a mismatch between Logical Minimum and Usage Minimum in the array that
> reports keycodes.
> 
> The offending portion of the descriptor: (from hid-decode)
> 
> 0x95, 0x05,                    //  Report Count (5)                   30
> 0x75, 0x08,                    //  Report Size (8)                    32
> 0x15, 0x00,                    //  Logical Minimum (0)                34
> 0x25, 0x65,                    //  Logical Maximum (101)              36
> 0x05, 0x07,                    //  Usage Page (Keyboard)              38
> 0x19, 0x01,                    //  Usage Minimum (1)                  40
> 0x29, 0x65,                    //  Usage Maximum (101)                42
> 0x81, 0x00,                    //  Input (Data,Arr,Abs)               44
> 
> This bug shifts all programmed keycodes up by 1. Importantly, this causes
> "empty" array indexes of 0x00 to be interpreted as 0x01, ErrorRollOver.
> The presence of ErrorRollOver causes the system to ignore all keypresses
> from the endpoint and breaks the ability to use the programmable buttons.
> 
> Setting byte 41 to 0x00 fixes this, and causes keycodes to be interpreted
> correctly.
> 
> Also, USB_VENDOR_ID_GLORIOUS is changed to USB_VENDOR_ID_SINOWEALTH,
> and a new ID for Laview Technology is added. Glorious seems to be
> white-labeling controller boards or mice from these vendors. There isn't a
> single canonical vendor ID for Glorious products.
> 
> Signed-off-by: Brett Raye <braye@fastmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


