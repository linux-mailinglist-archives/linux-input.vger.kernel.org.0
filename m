Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3922A314BEF
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 10:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhBIJmT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 04:42:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:54668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229988AbhBIJkM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 04:40:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A459D64E75;
        Tue,  9 Feb 2021 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612863572;
        bh=qyIY5yIfkzZT2WQpRKuBS43F1ALbQNPpRn9GbRBQhbA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pCJPXU293fk+JHz86CTeVwlegTTOaozPswsFpMlOu1dN7ZeF8GnXZxFS6czyIRWiK
         1msQ+BtOQwfpo1X6e1JkXgf9+yKoUu7O7IjBSc+w99moTs4Q97YbDn05/yTIcIsZJt
         P4RfFV9kAnlT5wUgzZBK4xFgx6lvG49EM6HrDSrG6E83WDfbIA6mH3C9gt8sohJGug
         M6sSYjiIyJgiDLmi5CGmLVlrNLid5ssRGWCFA9XESs7jCbkUuPgh4l0B33qMZdXWiO
         qdxRCChpX31ifhdP9AofVYn++l2RFzU/97HAwvDwNpkUPD48MNTkVmb3xs7kSAQN7Y
         DPxME9H5fJ8hg==
Date:   Tue, 9 Feb 2021 10:39:28 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     mail@richard-neumann.de
cc:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add quirks to AMD Sensor Fusion Hub driver
In-Reply-To: <20210127162600.35927-1-mail@richard-neumann.de>
Message-ID: <nycvar.YFH.7.76.2102091038350.28696@cbobk.fhfr.pm>
References: <20210127162600.35927-1-mail@richard-neumann.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 27 Jan 2021, mail@richard-neumann.de wrote:

> From: Richard Neumann <mail@richard-neumann.de>
> 
> This patch adds quirks to the upstream (v8) version of the
> AMD Sensor Fusion Hub driver.
> The quirks provide a function to detect the sensor mask for systems
> that do not have it stored in the AMD_P2C_MSG3 register.
> The information about the systems IDs and available sensors was
> taken from: https://bugzilla.kernel.org/show_bug.cgi?id=199715
> 
> Changes since v1:
> * Added missing object amd_sfh_quirks.o to amd_sfh-objs
> * changed type of "system" in "amd_sfh_quirks_get_sensor_mask"
>   - struct dmi_system_id -> const struct dmi_system_id

Nehal, Sandeep, can you please review this patchset? Thanks.

-- 
Jiri Kosina
SUSE Labs

