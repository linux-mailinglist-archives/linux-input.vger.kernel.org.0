Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786253B42ED
	for <lists+linux-input@lfdr.de>; Fri, 25 Jun 2021 14:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhFYMNu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Jun 2021 08:13:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:57832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230172AbhFYMNu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Jun 2021 08:13:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF9A16144B;
        Fri, 25 Jun 2021 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624623089;
        bh=hJphqqy5apCueZI5TPW2iyTbqSPK+8mA4JZ552edsaU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Fu7/8QDusBwR2Dw5JKPqFW+ENrk9lmdP0BC5GH53Xe6NVkjZ870+2Rvo2IpZQ4HTi
         wn+XdeA6uBzEosYSx9VbkA7HLSSsp+qBbIs9h4HSKITPgWUTJPkmzq7pKBH09HY+Na
         kySboGuYj1yiF0AC29h6cJvjB6sYjAB4MXCZk5qbTxq7gik+Y6FDY0kBcDLZVzGx6p
         mXi8sR+GFVnvIO4TWA7CweObuU6LihzI0NNJf1vz67CnIuLkxPPbNlXfIyJGHHUXvz
         DiSkNRBoIN9NqajnrJ2D5tLZ45Ytpv5CFxL3CH2zOfsLCJgQsFsm6zYRV+Utj1XZbo
         55uKGA74UlCKw==
Date:   Fri, 25 Jun 2021 14:11:27 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH -next] HID: thrustmaster: Switch to kmemdup() when allocate
 change_request
In-Reply-To: <20210511113033.3760555-1-yangyingliang@huawei.com>
Message-ID: <nycvar.YFH.7.76.2106251411200.18969@cbobk.fhfr.pm>
References: <20210511113033.3760555-1-yangyingliang@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 11 May 2021, Yang Yingliang wrote:

> Use kmemdup() helper instead of open-coding to
> simplify the code when allocate change_request.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

