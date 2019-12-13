Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A326E11DF7A
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 09:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfLMIb0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 03:31:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:45898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfLMIb0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 03:31:26 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED03D2465B;
        Fri, 13 Dec 2019 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576225885;
        bh=myyxeypyHriSKbglxnLcS2I3B1e+64R7xW7PX38Q1o0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=L8veSFtJD+zdDXJsLGDVe4LMCieF8IqYxpfAm+xeOhN/J+8LpWroYBbSh1ypSDU3Y
         /Uldl2uWaGNKlvqoUpqCApNOuHGYj89amLsGm1cUDrw1osCnxbGTVjgKG9fYCC/RUl
         leAT3QH0aZmqDRHiasQcI39kM9IuF+lxZo9lTa4A=
Date:   Fri, 13 Dec 2019 09:31:21 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH RFC 2/2] HID: usbhid: kcov: add annotations for coverage
 collection
In-Reply-To: <6b4b598d012d981c0c45fcc9f121ba210bd222f9.1576170740.git.andreyknvl@google.com>
Message-ID: <nycvar.YFH.7.76.1912130930220.4603@cbobk.fhfr.pm>
References: <cover.1576170740.git.andreyknvl@google.com> <6b4b598d012d981c0c45fcc9f121ba210bd222f9.1576170740.git.andreyknvl@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Dec 2019, Andrey Konovalov wrote:

> This patch adds kcov_remote_start/stop() callbacks into usbhid code that
> is executed in interrupt context. As the result, kcov can be used to
> collect coverage from those parts of the code, which is used to facilitate
> coverage-guided fuzzing with syzkaller.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Acked-by: Jiri Kosina <jkosina@suse.cz>

-- 
Jiri Kosina
SUSE Labs

