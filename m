Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73375373B9C
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhEEMnk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:43:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:33566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhEEMnk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:43:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36D9961132;
        Wed,  5 May 2021 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620218563;
        bh=j5tgY7P6UNnRgnZwcKAWN+v013/tjXzDMOOa52v8hj0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mc/IuCu2Pq6OzFcuAyZMNnqZZRpLxI98AEaW+RhjjNP9s0ypSX22cyZKHka2UXzp8
         RDuOVBCrEDB3O0c+NdE3VVG95tkWkZfmWzGvrh4iL84BoqpoW+TltKoSGK0+l9Pqhl
         O2q0Sg3kPP1IBWtXLp7QEn5jB9JzOBVNuz4cMzX/Z3qtyveL+Ke+LvuLTI1+38Vrtr
         +3mynjLXY+FFm3YjF1xj4Oe9lxjzi+MZLnqfghvrjeb9a8l1KZtGt8aPy9vfCM2evb
         0pj4/Y3p38j6I76Y/3gukTYVfBbCH7DSUB4l1nYN6g4n9c+fRAbdOf3Elajq4unGeE
         nvRxGtJeY7jkw==
Date:   Wed, 5 May 2021 14:42:40 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Anirudh Rayabharam <mail@anirudhrb.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
In-Reply-To: <20210425173353.10231-1-mail@anirudhrb.com>
Message-ID: <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
References: <20210425173353.10231-1-mail@anirudhrb.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 25 Apr 2021, Anirudh Rayabharam wrote:

> In hid_submit_ctrl(), the way of calculating the report length doesn't
> take into account that report->size can be zero. When running the
> syzkaller reproducer, a report of size 0 causes hid_submit_ctrl) to
> calculate transfer_buffer_length as 16384. When this urb is passed to
> the usb core layer, KMSAN reports an info leak of 16384 bytes.
> 
> To fix this, first modify hid_report_len() to account for the zero
> report size case by using DIV_ROUND_UP for the division. Then, call it
> from hid_submit_ctrl().
> 
> Reported-by: syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>

Benjamin, could you please run this one through your regression testing 
machinery before we send it upstream?

Thanks,

-- 
Jiri Kosina
SUSE Labs

