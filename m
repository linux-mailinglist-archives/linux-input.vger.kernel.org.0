Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BC6246897
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 16:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgHQOoH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 10:44:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:48180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728619AbgHQOoH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 10:44:07 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C6CA2076E;
        Mon, 17 Aug 2020 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597675446;
        bh=ABigrgmtWIZFl2q1/7lE+trJ9imHtpuuHULxc24inf8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=vIgJpSvKMcihuUuYGqNEgxuqs8QN+XrHkovxKuwPO/n+Zbm22q7vlv3RpXkY+4Q5H
         64QjvNj6da3o8LQNOtKMJ1PBIaQlnYtgYjcEjeDHDxG3LQxMOgIZ5nGIgnp40Dq3I9
         z5jeg93J0LtYQfRnNB+rrrijMSuEew6Qg+F0eYpc=
Date:   Mon, 17 Aug 2020 16:44:03 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     BALATON Zoltan <balaton@eik.bme.hu>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dan Bastone <dan@pwienterprises.com>
Subject: Re: [PATCH] HID: apple: Add support for Matias wireless keyboard
In-Reply-To: <alpine.BSF.2.22.395.2008171508120.88029@zero.eik.bme.hu>
Message-ID: <nycvar.YFH.7.76.2008171643460.27422@cbobk.fhfr.pm>
References: <20200720205741.0A114747871@zero.eik.bme.hu> <nycvar.YFH.7.76.2008171214110.27422@cbobk.fhfr.pm> <alpine.BSF.2.22.395.2008171508120.88029@zero.eik.bme.hu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 17 Aug 2020, BALATON Zoltan wrote:

> AFAIK the Apple keyboard with the same pid is a USB one and is already 
> handled by hid-apple. This one is a bluetooth keyboard so probably does 
> not really clash and even if there's an Apple wireless keyboard with the 
> same pid it's more likely we want hid-apple for that too so it's 
> unlikely to break anything. (This Matias keyboard looks and acts like an 
> Apple keyboard so probably uses this vid/pid to have macOS work better 
> with it out of the box without needing additional setup.)

Thanks for the bakcground. The patch is now in hid.git#for-5.10/apple

-- 
Jiri Kosina
SUSE Labs

