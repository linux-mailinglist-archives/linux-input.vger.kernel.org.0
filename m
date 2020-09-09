Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451DE262756
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 08:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgIIGsh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 02:48:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbgIIGsh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Sep 2020 02:48:37 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E64A21532;
        Wed,  9 Sep 2020 06:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599634117;
        bh=r+iun9GKBgUIYvgcdSjSA0N/go3F8FpVCSzZvm6c+9U=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=L6T05Jf+1J4utRWfWlpgAo5CLPUP6sEh4N6ofgZeqYzQqtqibPGduy1zsocQMF0os
         qkmfPqw8wbZTu/oupPWIU0o3/9pk8guKWqE+ORX9ZGDF61jz0v4PIpZrI6M0DeIS1B
         /dNq5A9gzJCTnTnhUVLXvVJFPjx5xRRGIuYVXg+8=
Date:   Wed, 9 Sep 2020 08:48:34 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Laurent Gauthier <laurent.gauthier@soccasys.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-debug: fix nonblocking read semantics wrt
 EIO/ERESTARTSYS
In-Reply-To: <20200908221149.8986-1-laurent.gauthier@soccasys.com>
Message-ID: <nycvar.YFH.7.76.2009090848190.4671@cbobk.fhfr.pm>
References: <20200908221149.8986-1-laurent.gauthier@soccasys.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 9 Sep 2020, Laurent Gauthier wrote:

> When the file has been open in non-blocking mode, EIO or ERESTARTSYS
> would never be returned even if they should (for example when device
> has been unplugged, you want EIO and not EAGAIN to be returned).
> 
> Move the O_NONBLOCK check after other checks have been performed.

Makes sense, good catch. Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

