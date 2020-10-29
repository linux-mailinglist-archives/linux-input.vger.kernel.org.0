Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA2529EF0E
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 16:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgJ2PDV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 11:03:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727933AbgJ2PDU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 11:03:20 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5388B20759;
        Thu, 29 Oct 2020 15:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603983800;
        bh=/m0ZiVrVXr02jrgeLf967OYFWeg3Z/wgT9FSdLb1gHY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rLdHk0B15Ub9uwiUgJADmNDEUlI63bB4qu8+zpDBxhsQyoVJUy7HaI0epNvclKgMg
         U+l2vmyugIiWdSbSdNrcdMsTSiDLzp3P/kzVcF357zfxDKwVSEAN23MnmRUDA3XdZP
         wQ9pUtfQrDaNE1rB0bg2AP9q1pSIgaRWKtXByHio=
Date:   Thu, 29 Oct 2020 16:03:16 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sandeep Singh <Sandeep.Singh@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, jic23@kernel.org,
        Nehal-bakulchandra.Shah@amd.com, mail@richard-neumann.de,
        Shyam-sundar.S-k@amd.com, lipheng@hanmail.net
Subject: Re: [PATCH v3] AMD_SFH: Fix for incorrect Sensor index
In-Reply-To: <20201028090010.2689060-1-Sandeep.Singh@amd.com>
Message-ID: <nycvar.YFH.7.76.2010291602550.18859@cbobk.fhfr.pm>
References: <20201028090010.2689060-1-Sandeep.Singh@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 28 Oct 2020, Sandeep Singh wrote:

> From: Sandeep Singh <sandeep.singh@amd.com>
> 
> It appears like the accelerometer/magnetometer and gyroscope
> indices were interchanged in the patch series which got into
> for-5.11/amd-sfh-hid until Mandoli/Richard reported to us.
> Ideally sensor indices should be 0,1,2 for the accelerometer,
> Gyroscope, Magnetometer respectively, but this interchanged
> possibly could be because i was using a test MP2 firmware
> on my machine.
> 
> This patch fixes the earlier commit with the right sensor
> indices and also removing unused structures
> _hid_report_descriptor,
> _hid_device_descriptor as reported by Richard.
> 
> Reported-by: Mandoli <lipheng@hanmail.net>
> Reported-by: Richard Neumann <mail@richard-neumann.de>
> Signed-off-by: Sandeep Singh <sandeep.singh@amd.com>
> Fixes: SFH: PCIe driver to add support of AMD sensor fusion hub (4f567b9f8141)

I've modified the Fixes: tag so that it has proper format and applied, 
thanks.

-- 
Jiri Kosina
SUSE Labs

