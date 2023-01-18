Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85E067188B
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 11:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjARKI2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 05:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjARKHd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 05:07:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37626E810
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 01:12:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F70E6173E
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 09:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90D7C433D2;
        Wed, 18 Jan 2023 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674033148;
        bh=DO1Dt5nQfX6tZZ1TlahNOJYkSC3Y16RF4bghgdpXtls=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Fnw7G9lHHtDKB1bdHSQsQwYPQsqs1xs3lio+VxFX5OzN0BOHaDTjSAKeY3gnWFw78
         yPY1VWESdcAS6/tiXzKN4GPkXBv4T4vNK0HrbrRO8fX8i+MwUAv+cgp3Y6rBp6awkh
         OuuoxOKX9B4QJIYlAJP+IKgocOMrLqFv8iXBgwo+lxHoRMR44NqABZEyLcC0gsqHkq
         zo4ZrrgAfq3jlr42fJO5dNIW8Kgke/cVz4EGdf3qx4N8CGCT7r5J5SUmJBKJ4yX+NT
         rbl1wL7TE1hGPKgDCblH8XHELBmtDS9uxF8aRgSto0TDLl7K4CPXdRMiEe5g0lfeAv
         +so6UE4mZef0A==
Date:   Wed, 18 Jan 2023 10:12:30 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 4/5] HID: playstation: correct DualShock4 gyro bias
 handling.
In-Reply-To: <20230106015910.3031670-5-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2301181012220.1734@cbobk.fhfr.pm>
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com> <20230106015910.3031670-5-roderick.colenbrander@sony.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 5 Jan 2023, Roderick Colenbrander wrote:

> The bias for the gyroscope is not used correctly. The sensor bias
> needs to be used in calculation of the 'sensivity' instead of being
> an offset.
> 
> In practice this has little input on the values as the bias values
> tends to be small (+/- 20).
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>

Applied to for-6.3/sony.

-- 
Jiri Kosina
SUSE Labs

