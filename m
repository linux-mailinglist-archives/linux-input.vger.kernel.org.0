Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC2774D000
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 10:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbjGJIdZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 04:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbjGJIdF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 04:33:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BED18B
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 01:32:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 121CD60F18
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 08:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76554C433C7;
        Mon, 10 Jul 2023 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688977970;
        bh=Kvu5XFGd8gq+TRVOI6KeyS8ob2+NrTWdPj78OB8xYOw=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=FZ6CBVPnlbxH37/1Xzjjo6JeKssryDw9nO5D9k5g7s+8y579liZzNLkivIlaUj9wu
         17PX2NCyzLaSW5MubpGwQ9cAFUHgrl+BgmIAVfGSvZJqM3GYzdhj1RRtT9i+yvsaQm
         xBr64y7QyiejWb1uEO1KDNZnUwnTAVBngfEZ3/WXtqrGPEyt9yCdiBHypFx5VDyS/V
         o44gcdxlg1E5jp/mULa+VagP5/C9x5kevjfEXEo8VQfb13WLzBHnAQVTqWMm1pgojv
         JouZ68+jIBOhCXVCQ/1gwyHnggxBdkujagjQaEE71Ipzs65NO6yvNgDiS9iXg5Xgiq
         MuxdywBJlQf0A==
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, akshata.mukundshetty@amd.com,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
In-Reply-To: <20230707065722.9036-1-Basavaraj.Natikar@amd.com>
References: <20230707065722.9036-1-Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH 0/2] Updates to amd_sfh
Message-Id: <168897796922.315593.8416774627477199569.b4-ty@kernel.org>
Date:   Mon, 10 Jul 2023 10:32:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 07 Jul 2023 12:27:20 +0530, Basavaraj Natikar wrote:
> This patch series include changes for renaming the float32 variable
> including the fix for shift-out-of-bounds issue.
> 
> Basavaraj Natikar (2):
>   HID: amd_sfh: Rename the float32 variable
>   HID: amd_sfh: Fix for shift-out-of-bounds
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.5/upstream-fixes), thanks!

[1/2] HID: amd_sfh: Rename the float32 variable
      https://git.kernel.org/hid/hid/c/c1685a862a4b
[2/2] HID: amd_sfh: Fix for shift-out-of-bounds
      https://git.kernel.org/hid/hid/c/878543661764

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>

