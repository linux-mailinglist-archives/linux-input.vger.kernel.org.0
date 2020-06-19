Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FADD200292
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 09:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgFSHPz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 03:15:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:52578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730329AbgFSHPx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 03:15:53 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7269F2078D;
        Fri, 19 Jun 2020 07:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592550953;
        bh=epIDZKQdTwE1MW539B+tuV7ILotiTGRB84XqiGR/YDw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=I3zIhqk44E2hS3DLEY8+YmYLvXgypa3wEJZR2/lBrhJjBQ/DPrP99kKCJbZEPrZDK
         pwN2ljEQ75NDMmelq/vGTs6ijH16OcH3u6dvac2nX448MT3TwKxilq7KgnRjluyZ7b
         /kptJk/ClI7O+eZwMFznDlg7P8dY3eUJpBO0omhc=
Date:   Fri, 19 Jun 2020 09:15:50 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Fran=E7ois-Xavier_Carton?= <fx.carton91@gmail.com>
cc:     linux-input@vger.kernel.org, Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2 2/4] HID: gamecube-adapter: add rumble support
In-Reply-To: <20200512084616.32158-2-fx.carton91@gmail.com>
Message-ID: <nycvar.YFH.7.76.2006190915260.13242@cbobk.fhfr.pm>
References: <20200512084616.32158-1-fx.carton91@gmail.com> <20200512084616.32158-2-fx.carton91@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 12 May 2020, François-Xavier Carton wrote:

> Add rumble support for the hid-gamecube-adapter driver. Rumble is
> reported with a single output report for all four controllers.
> 
> Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>

Francois,

somehow I seem to be missing 1/4 from this series in my inbox. Could you 
please resend it my way?

Thanks.

-- 
Jiri Kosina
SUSE Labs

