Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13752F610A
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 13:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbhANM1G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 07:27:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:55912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbhANM1G (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 07:27:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20FFA23A52;
        Thu, 14 Jan 2021 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610627186;
        bh=gvd4gVWNfbd8GviT5V5aDxPg/AGYPa8RVllqWSJQjew=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XgQdVL2doqoHL8o0/66aLGjQT/TNfVWZx68L5E8a3d8SpwmX7zMIrtAORD0cHk2aw
         wJo09nAIzoDNMs/HLNpLcTyEP3X4qjdfaKHha1KabpJtCjejGjZ1k10xCfoFLR/98v
         XGRII3uk6oYmymW35pzcnvFuhYFu1uZgiLuZsusjFE0nwK7lFuUGMVOCr8xwgnGwS5
         ZCeMJvQlLOzvXGdDYLz2W+UVrfnlWQf6kRqSXZT4SZzRT3ZUkoQ7O2oje9YGGdPsiv
         0f7SIX2jR0r4rhT/1qVNOr8hqc1oYlXNSwWavI/LgsKQ/0fJ9nwZdWVf57n5ubLhnH
         vxfyicbYg8+Gg==
Date:   Thu, 14 Jan 2021 13:26:23 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Nicholas Miell <nmiell@gmail.com>
cc:     benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Add product ID for MX Ergo in
 Bluetooth mode
In-Reply-To: <6b58bc1e-7ab8-0d5b-be9e-a8c29df2c252@gmail.com>
Message-ID: <nycvar.YFH.7.76.2101141325490.13752@cbobk.fhfr.pm>
References: <6b58bc1e-7ab8-0d5b-be9e-a8c29df2c252@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 10 Jan 2021, Nicholas Miell wrote:

> The Logitech MX Ergo trackball supports HID++ 4.5 over Bluetooth. Add its
> product ID to the table so we can get battery monitoring support.
> (The hid-logitech-hidpp driver already recognizes it when connected via
> a Unifying Receiver.)
> 
> Signed-off-by: Nicholas Miell <nmiell@gmail.com>

Thanks for the patch. It was whitespace damaged by your mail client 
though. I've fixed it manually and applied, but please look into fixing 
this for any future patch submissions.

-- 
Jiri Kosina
SUSE Labs

