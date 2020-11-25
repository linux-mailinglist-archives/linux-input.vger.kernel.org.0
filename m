Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384302C412E
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgKYNcp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 08:32:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:55836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgKYNcp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:32:45 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4175206E5;
        Wed, 25 Nov 2020 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606311164;
        bh=8DBMiftvngp+f4Aqi1W+w5dnFZoKqQn0sIPvQwssdb8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=VDymKYm+S3Pfz2N1hQMZmO1BuTPxfLKuFYmg1ZZQUOSg/LJII6VT2h0RiQPIc30hn
         qcpqwATMi0UazJIECQq7VWc4lJjkEJjy/wrTFv5tB3FUHqEowR3P5HGoxRYwzVvZyu
         A7yjSFFMDzgk1F85DKgDAVc3kh/sWyHCnDzZkPbY=
Date:   Wed, 25 Nov 2020 14:32:41 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Wladimir J. van der Laan" <laanwj@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        Ethan Warth <redyoshi49q@gmail.com>
Subject: Re: [PATCH] HID: add support for 0079:1846 Mayflash/Dragonrise USB
 Gamecube Adapter
In-Reply-To: <20201117084800.2054276-1-laanwj@gmail.com>
Message-ID: <nycvar.YFH.7.76.2011251432330.3441@cbobk.fhfr.pm>
References: <20201117084800.2054276-1-laanwj@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 Nov 2020, Wladimir J. van der Laan wrote:

> From: Ethan Warth <redyoshi49q@gmail.com>
> 
> Mayflash/Dragonrise seems to have yet another device ID for one of their
> Gamecube controller adapters.  Previous to this commit, the adapter
> registered only one /dev/input/js* device, and all controller inputs (from
> any controller) were mapped to this device.  This patch defines the 1846
> USB device ID and enables the HID_QUIRK_MULTI_INPUT quirk for it, which
> fixes that (with the patch, four /dev/input/js* devices are created, one
> for each of the four controller ports).
> 
> Signed-off-by: Ethan Warth <redyoshi49q@gmail.com>
> Tested-by: Wladimir J. van der Laan <laanwj@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

