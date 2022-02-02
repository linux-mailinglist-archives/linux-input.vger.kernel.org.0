Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54864A72AA
	for <lists+linux-input@lfdr.de>; Wed,  2 Feb 2022 15:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbiBBOFW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Feb 2022 09:05:22 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:33606 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235355AbiBBOFV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Feb 2022 09:05:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA736185C
        for <linux-input@vger.kernel.org>; Wed,  2 Feb 2022 14:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F93C004E1;
        Wed,  2 Feb 2022 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643810720;
        bh=7e0Ryuce30XX2NnMZHZ/MK+7uZFBS9sALNKkbx1rJNQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=hXFyTvC3rAgal6/vCrlkF7FOU8eNFQ10BSnDH/MIhmjDuMcCkTPyArOYgja5R4Qgb
         g2Yna1tXJeY1hvjo+CbtSP99Ri+JT+9xel2yVDOsvteYEL5Gg9CEWedBLQWHH4ws/N
         UHyrQq1rWsIwoItbDmIJNx8BMzAhoBMXxO1I9nhsKCC2EElvLBgo65m6bnxXe9RPE5
         LaN91etXvmAQDpT/fPFTLKq1L1PYwhvEHKLYM2x4A6ZTAtw32xjcuFCYlo/sr+JTpN
         hNP+zOdbS3z2BqOUfDABt0v9ZDBdd9aTwWhhJ1dJJ5+nQ/CYxroohNvR/8zxph4Yd2
         acl0LVCuHRevg==
Date:   Wed, 2 Feb 2022 15:05:17 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Nehal-Bakulchandra.shah@amd.com
Subject: Re: [PATCH 0/2] Fixes to amd_sfh driver 
In-Reply-To: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2202021504470.11721@cbobk.fhfr.pm>
References: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 31 Jan 2022, Basavaraj Natikar wrote:

> Changes include increasing sensor command timeout and
> adding illuminance mask value.
> 
> Basavaraj Natikar (2):
>   amd_sfh: Increase sensor command timeout
>   amd_sfh: Add illuminance mask to limit ALS max value

Please make sure to follow the convention and always prefix HID patches 
with 'HID: ' in the shortlog.

I've fixed that up on my side now and applied for 5.17. Thanks,

-- 
Jiri Kosina
SUSE Labs

