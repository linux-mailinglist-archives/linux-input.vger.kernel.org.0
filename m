Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74118228084
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 15:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGUNEO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 09:04:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:38218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgGUNEO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 09:04:14 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C56142073A;
        Tue, 21 Jul 2020 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595336653;
        bh=KyS7IuXaUykYsn3gzRCVOrDcUOrccKvhZaWAofOy//E=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=STqlJkRml/81YJN6MesoA0pbsphT5H9jvNT8WSPWfKiF4ak8xb2W9lsx1EjXzD4lZ
         MXIUspk7SJIE8QA5A82VQSbCUT5/3YUllwz/iQ8z9evK1EfmMdh0byLq7Km+AAXXws
         4IbcY0z7Y8IHm1xc1WVtdKhcBAuf7WzXVAE2G5r8=
Date:   Tue, 21 Jul 2020 15:04:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: add NOGET quirk for Logitech GROUP
In-Reply-To: <20200721065409.1508737-1-ikjn@chromium.org>
Message-ID: <nycvar.YFH.7.76.2007211504020.23768@cbobk.fhfr.pm>
References: <20200721065409.1508737-1-ikjn@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 21 Jul 2020, Ikjoon Jang wrote:

> Add HID_QUIRK_NOGET for Logitech GROUP device.
> 
> Logitech GROUP is a compound with camera and audio.
> When the HID interface in an audio device is requested to get
> specific report id, all following control transfers are stalled
> and never be restored back.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=203419
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

