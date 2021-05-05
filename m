Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F2F373B96
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbhEEMl4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:41:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232200AbhEEMlz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:41:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F5FC613BF;
        Wed,  5 May 2021 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620218459;
        bh=373pf+MqHyV2SfhsxGCiXq4L4TBQKH0qptC9/yYCkJw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ez/0oylNQJMQXkh/X9UzLDIp4WSi66u0kCgRDKzmXAT+QkimTjfAqyiRpFDRjRUge
         6Bq3lOhS6edOYflkrKso2WXMSIwaSXVAf6/JK4jIAHZP7JgcOISrng9CUgS9aP8WLP
         InyxVcqTlgpl/QP5bgTiQOvGL6Tv8gmMSmZcJ/+TB/g9b59Pffl1UEEHXoIYlDa2az
         mLUgeX3KF08bFQV7M/oBKQg6rEm68xdscly90+XW9s+JevVUIi+u+6qy18gt0zmQVe
         /llrDtpevbDHJCOO56G1jfttIEe+0AaNLHH1IFgt5DMRXVB40sQE8BedrywCSc4e4G
         wSOlITeVK2Ivw==
Date:   Wed, 5 May 2021 14:40:56 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Luke D Jones <luke@ljones.dev>
cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: asus: filter G713/G733 key event to prevent
 shutdown
In-Reply-To: <20210418091229.26001-1-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2105051440430.28378@cbobk.fhfr.pm>
References: <20210418091229.26001-1-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 18 Apr 2021, Luke D Jones wrote:

> The G713 and G733 both emit an unexpected keycode on some key
> presses such as Fn+Pause. The device in this case is emitting
> two events on key down, and 3 on key up, the third key up event
> is report ID 0x02 and is unfiltered, causing incorrect event.
> 
> This patch filters out the single problematic event.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

