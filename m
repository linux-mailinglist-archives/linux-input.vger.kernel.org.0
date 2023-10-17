Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E177CC59F
	for <lists+linux-input@lfdr.de>; Tue, 17 Oct 2023 16:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbjJQOLZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Oct 2023 10:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234973AbjJQOLY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Oct 2023 10:11:24 -0400
Received: from dsmtpq2-prd-nl1-vmo.edge.unified.services (dsmtpq2-prd-nl1-vmo.edge.unified.services [84.116.6.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C45FC
        for <linux-input@vger.kernel.org>; Tue, 17 Oct 2023 07:11:21 -0700 (PDT)
Received: from csmtpq1-prd-nl1-vmo.edge.unified.services ([84.116.50.35])
        by dsmtpq2-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <gareth.randall@virgin.net>)
        id 1qskmz-00G78h-Ql
        for linux-input@vger.kernel.org; Tue, 17 Oct 2023 16:11:17 +0200
Received: from csmtp3-prd-nl1-vmo.nl1.unified.services ([100.107.82.133] helo=csmtp3-prd-nl1-vmo.edge.unified.services)
        by csmtpq1-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <gareth.randall@virgin.net>)
        id 1qskmv-00EpPK-L5
        for linux-input@vger.kernel.org; Tue, 17 Oct 2023 16:11:13 +0200
Received: from [192.168.0.10] ([94.175.123.86])
        by csmtp3-prd-nl1-vmo.edge.unified.services with ESMTPA
        id skmvqYH85xO9gskmvqdXTJ; Tue, 17 Oct 2023 16:11:13 +0200
X-SourceIP: 94.175.123.86
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=L73bAcf8 c=1 sm=1 tr=0 ts=652e9601 cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=sn4smrsDL-ITpKfMYTMA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1697551873;
        bh=lffuEQrbrY8v/weOXxyI+U5BXBfNioosONSsFzJbpK0=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To;
        b=jkuET0mZp1MsYukdYspW8RDSVF5o0XrVMrNOYZxsStwpfjZ3o28UCWHl606S3WQru
         L/N/0n7x9OLlNWnAIDQYXJh1A0bwNv1nzMsEVFzxnzRIWwhg4p3tJ2NduLa3+AwTx5
         IKMg4JNXPBLk5IzFfUoO3bVPdgTVMEfDtzub4Fbt1+xTjVDadlU5nnE5KPqcscjDbA
         zil7cBvsu3l/SUN4J9L5KzWoDurfWFjaTfiFr1McECjnqEH9JhubOhYANn/hRuHraF
         bSkEnc9yB8X2+0dGxFZ3gk6v6qO8EWfNGKz8frUbDcQH1qxHZs1rU4WfrqtqrvyFLb
         3Kjr+qn7HmCmg==
Message-ID: <c7d1cb86-47ca-48af-95d0-d438593debf4@virgin.net>
Date:   Tue, 17 Oct 2023 15:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/1] Add support for touch screens using the
 General Touch ST6001S controller.
Content-Language: en-GB
From:   Gareth Randall <gareth.randall@virgin.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
 <YYi8FvXkV5i9baoN@google.com>
 <83a934eb-e1ee-fd79-33ee-76413be2e6ea@virgin.net>
In-Reply-To: <83a934eb-e1ee-fd79-33ee-76413be2e6ea@virgin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF2xxR3BuuyBRpbKqtvCOGPzwrZhjM6qZs/00S+i1AHJJG/MhUHf3XNZhWJsBYQKmTKTXL6njiLzn3cylrWtne4QqCZzlEluCigyhc7PG2ch0fwtMrIh
 X1ZRp//lr9/rkNSXklDMN+E+rsP6oWb6pb1ysgqCGt5FKjEopbhRxFNaJDk36EePIYYlQ3yFSaWuc7UswLzaAk7BpTT60xJBwnATPXfCwmnWN8Q6ITRmFgH3
 wbH5UM8FgFA8HpOHUzqYZA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Dmitry,

I've noticed that this update from a couple of weeks ago hasn't come up 
in the Patchwork system, probably because the original post was too long 
ago.

I'll happily resubmit this if you (or any other admins) would like me to.

Thanks.

Gareth

On 03/10/2023 19:32, Gareth Randall wrote:
> Hi Dmitry,
> 
> Thanks very much for the feedback. Apologies for the long delay in 
> getting back to you on this. Updated patch is below, and apologies for 
> the email layout. I've also added comments to your points in the quoted 
> message.
[snip]

