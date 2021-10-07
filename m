Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB403425221
	for <lists+linux-input@lfdr.de>; Thu,  7 Oct 2021 13:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhJGLje (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Oct 2021 07:39:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232829AbhJGLje (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Oct 2021 07:39:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E72861139;
        Thu,  7 Oct 2021 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633606660;
        bh=jon9QRneDnwbpXvgJ1AQzkE9ST+b9fV5l8WRP/UVnWQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IMqggbLYJ/s05flqy/AskDxc/T0urdB6/cux0H912wXAYtmpJEIbqzaDiE2a+5wCS
         yGUtpSL8cAl/YiAAdHH3XThbVS30shkJtKpcQv3Vc+WDlrCVZ1waP/mHq2E6l2wQss
         2u7GPkj+cvvgK5pJQhAtSaKSqFopFlXdu3TNeC/ltD6EDmY3lVfziNnXPUkGDmeIMh
         Lkrguz2Q/+H0qPpnGREX1G7ptB9Pk90Mr1Y6EG6oaxaay4stG9rY+6DgPMl5ZiG7BM
         0Kr1erlOa18WZVFGJ+eCMCbl5b+sJ9EtctSoZ1TZzgamXHbcWWSJejMaKEkY/8dNtL
         TUarjORd64ViA==
Date:   Thu, 7 Oct 2021 13:37:37 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: cougar: Make use of the helper function
 devm_add_action_or_reset()
In-Reply-To: <20210922125932.374-1-caihuoqing@baidu.com>
Message-ID: <nycvar.YFH.7.76.2110071337290.29107@cbobk.fhfr.pm>
References: <20210922125932.374-1-caihuoqing@baidu.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 22 Sep 2021, Cai Huoqing wrote:

> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and if devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

