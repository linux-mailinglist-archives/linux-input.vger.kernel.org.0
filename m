Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E8534E214
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 09:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhC3HXT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 03:23:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231380AbhC3HWw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 03:22:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 099C761935;
        Tue, 30 Mar 2021 07:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617088972;
        bh=IIjPXQtDXMWSpwjmyw4/gNUbmicl8QhCQWMmzGlavAI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=GSvnW6yn6nrsW5K/UFqF3U1v/oxgi1koczzlyqjSfY0tcmJ/CGAy7TPae7SUxlvHN
         vafTaL7/EN5daUbx3kCv4M8nRFAu73A3aMul9AVgf75XoAc9JH6dBBNaNyCKOUqX8X
         iSwt+c/ecRiGzeWdzUb/NHC4+D7ylCBM5E7SQKVU0Z5kiNVTvKTy7o2iVqIyOrFdjs
         y/sjq2xjeZwiAy3XI73M/9vKq1DcxWKUQt8QR/+s/lsE97J7gn5FtTJ0DsSlOQxfWj
         50hmDpFjmx9S/gE8pCZqMGMA+khp5Lw+vTKr8UMl2yFhJJG+7Dfw2I7XYY3Vo7VgL0
         7Lmucj+h6tReg==
Date:   Tue, 30 Mar 2021 09:22:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Maximilian Luz <luzmaximilian@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        =?ISO-8859-15?Q?Bla=B8_Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: Add support for Surface Aggregator Module HID
 transport
In-Reply-To: <20210310225329.2393372-1-luzmaximilian@gmail.com>
Message-ID: <nycvar.YFH.7.76.2103300922320.12405@cbobk.fhfr.pm>
References: <20210310225329.2393372-1-luzmaximilian@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 10 Mar 2021, Maximilian Luz wrote:

> This series adds support for the Surface System Aggregator Module (SSAM)
> HID transport subsystem.
> 
> The SSAM is an embedded controller, found on 5th- and later generation
> Microsoft Surface devices. On some of these devices (specifically
> Surface Laptops 1, 2, and 3, as well as Surface Book 3), built-in input
> devices are connected via the SSAM. These devices communicate (mostly)
> via normal HID reports, so adding support for them is (mostly) just a
> matter of implementing an HID transport driver.
> 
> SSAM actually has two different HID interfaces: One (legacy) interface
> used on Surface Laptops 1 and 2, and a newer interface for the rest. The
> newer interface allows for multiple HID devices to be addressed and is
> implemented in the first patch. The older interface only allows a single
> HID device to be connected and, furthermore, only allows a single output
> report, specifically one for the caps lock LED. This is implemented in
> the second patch.
> 
> See the commit messages of the respective patches for more details.

Now queued in hid.git#for-5.13/surface-system-aggregator-intergration

Thanks,

-- 
Jiri Kosina
SUSE Labs

