Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12DA627F37D
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 22:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgI3UpT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 16:45:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:52526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgI3UpT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 16:45:19 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE43F2064E;
        Wed, 30 Sep 2020 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601498718;
        bh=D+1bk/wAr+qIfP3UhPKHRaPdFXP0h8evABPoqNnET+g=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=zr+nBP2MNv41tehTe8SNFAcg6NScFHaKSFwZMpivRCMYTGI+0jywYtsQYvH71oOb5
         XFOcUZ/DAeh8C2yBQZ6n+r6zr9U8bUm8hmQMy6yT+geHDlh8bQtbHH5/yttfeRqBZ+
         EGyj37ioAKXtXJXwNFxvCZHV2xxq0ABBsmr0OC7E=
Date:   Wed, 30 Sep 2020 22:45:15 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sean O'Brien <seobrien@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] HID: add vivaldi HID driver
In-Reply-To: <20200909150254.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
Message-ID: <nycvar.YFH.7.76.2009302245040.3336@cbobk.fhfr.pm>
References: <20200909150254.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 9 Sep 2020, Sean O'Brien wrote:

> Add vivaldi HID driver. This driver allows us to read and report the top
> row layout of keyboards which provide a vendor-defined (Google) HID
> usage.
> 
> Signed-off-by: Sean O'Brien <seobrien@chromium.org>

Queued in hid.git#for-5.10/vivaldi. Thanks,

-- 
Jiri Kosina
SUSE Labs

