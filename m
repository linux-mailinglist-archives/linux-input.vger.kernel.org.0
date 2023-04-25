Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487A76EDE9F
	for <lists+linux-input@lfdr.de>; Tue, 25 Apr 2023 11:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbjDYJBG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Apr 2023 05:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjDYJBF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Apr 2023 05:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F58185
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682413219;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Usnm6DnohrX9DxOgO3R9HbvGNuxt4ihVRNuuRqzRJ7g=;
        b=Q/qg4JwZnOPxWQx8CcAkuiF0fMFQ2lw171kErNo04+itfFAaCr5o0yGZnih8bG5fiZXXrr
        OFUojy0cL3QVEeUvt5d0OUOMgpqY1Xdpyzn56WOvhV+E+wioO4/m5+iFy6JFFzmYshzYUr
        p6h4Tm7IYCyr8u9r6I/DnS3M+zOWA4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-WjWOSxD4P6ujA8zRsPB51Q-1; Tue, 25 Apr 2023 05:00:17 -0400
X-MC-Unique: WjWOSxD4P6ujA8zRsPB51Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A869FA0F381;
        Tue, 25 Apr 2023 09:00:16 +0000 (UTC)
Received: from [192.168.110.200] (unknown [10.45.227.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5E740C2064;
        Tue, 25 Apr 2023 09:00:15 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     jikos@kernel.org, linux-input@vger.kernel.org,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
In-Reply-To: <20230424160406.2579888-1-Basavaraj.Natikar@amd.com>
References: <20230424160406.2579888-1-Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH linux-next] HID: amd_sfh: Fix max supported HID devices
Message-Id: <168241321566.254035.14430221681174426932.b4-ty@redhat.com>
Date:   Tue, 25 Apr 2023 11:00:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 24 Apr 2023 21:34:06 +0530, Basavaraj Natikar wrote:
> commit 4bd763568dbd ("HID: amd_sfh: Support for additional light sensor")
> adds additional sensor devices, but forgets to add the number of HID
> devices to match. Thus, the number of HID devices does not match the
> actual number of sensors.
> 
> In order to prevent corruption and system hangs when more than the
> allowed number of HID devices are accessed, the number of HID devices is
> increased accordingly.
> 
> [...]

Applied to hid/hid.git (for-6.4/amd-sfh), thanks!

[1/1] HID: amd_sfh: Fix max supported HID devices
      https://git.kernel.org/hid/hid/c/37386669887d

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

