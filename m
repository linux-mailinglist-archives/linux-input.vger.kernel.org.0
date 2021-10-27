Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5740143C4E4
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 10:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238774AbhJ0ISy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 04:18:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:48574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231715AbhJ0ISv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 04:18:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 891D360F9D;
        Wed, 27 Oct 2021 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635322586;
        bh=3JydniCQn4KNgotUME7m6cpryAkl3OphYsMpRDjv0w0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=CffTCBKYFYwnUKFb4K8+kdDihnk92OZsxmc6SpB5DF+PyyvXx4PKYwCtugfgslLA8
         hUh6meLuzrSY9yxlsKNdjMiMJtLq1Rzk+w7p474hNcbUoUw6+yKGWwLhtfIzq1Gpfb
         PzSZ3OIZ75+RDc0S6hZq8eb9LECuA6idcumhlb5taglZrmgN6TTSmViHgmlTBLbzO2
         xrMM2cN5UYCt2P4phURjSBVZ+C/zAVvaP+/vVR2Vxj90LkCXXsdnPwNNvYHJwy0jVw
         M5/oqPheDabsofIJrMI7KDi5XYBHheGPRrJT44UG5RGzdylFGIGAAGbZXWlh7t64Zp
         t+AthCy0wcf/w==
Date:   Wed, 27 Oct 2021 10:16:23 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Andrej Shadura <andrew.shadura@collabora.co.uk>
cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com, Szczepan Zalega <szczepan@nitrokey.com>
Subject: Re: [PATCH] HID: u2fzero: Support NitroKey U2F revision of the
 device
In-Reply-To: <20211023141710.348341-1-andrew.shadura@collabora.co.uk>
Message-ID: <nycvar.YFH.7.76.2110271016110.12554@cbobk.fhfr.pm>
References: <20211023141710.348341-1-andrew.shadura@collabora.co.uk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 23 Oct 2021, Andrej Shadura wrote:

> NitroKey produced a clone of U2F Zero with a different firmware,
> which moved extra commands into the vendor range.
> Disambiguate hardware revisions and select the correct configuration in
> u2fzero_probe.
> 
> Link: https://github.com/Nitrokey/nitrokey-fido-u2f-firmware/commit/a93c16b41f
> Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>

Applied, thanks Andrej.

-- 
Jiri Kosina
SUSE Labs

