Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EEF246413
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 12:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgHQKHO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 06:07:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726760AbgHQKHO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 06:07:14 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEE7D2067C;
        Mon, 17 Aug 2020 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597658834;
        bh=eCw+2/lSjBV7bP7ZhU0BJWsyz5bbYEzAf+VX/NT+hPs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=iIIPM/3UjTg70NVgUJxOiOTsp3FhTrRIe4qeOMH4R3Pq32ZYAIdcsq4RXZriqMUoS
         UskIS4j8TH1QhGIw71c0/ypsYfJSrZ22eT6mj0CjMXQBrLP2Cy9V9uiQv5stR+Xfcb
         tHZ0SJpTD95agWGCKWw5QgN+9IypUs6jEOj/+1E8=
Date:   Mon, 17 Aug 2020 12:07:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Stefan Achatz <erazor_de@users.sourceforge.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
In-Reply-To: <20200805095501.GD483832@mwanda>
Message-ID: <nycvar.YFH.7.76.2008171206280.27422@cbobk.fhfr.pm>
References: <20200805095501.GD483832@mwanda>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 5 Aug 2020, Dan Carpenter wrote:

> In the original code we didn't check if the new value for
> "settings->startup_profile" was within bounds that could possibly
> result in an out of bounds array acccess.  What we did was we checked if
> we could write the data to the firmware and it's possibly the firmware
> checks these values but there is no way to know.  It's safer and easier
> to read if we check it in the kernel as well.
> 
> I also added a check to ensure that "settings->size" was correct.  The
> comments say that the only valid value is 36 which is sizeof(struct
> kone_settings).
> 
> Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Stefan, could I please get your Reviewed-by and/or Tested-by, to make sure 
this doesn't unintentionally somehow break userspace?

Thanks,

-- 
Jiri Kosina
SUSE Labs

