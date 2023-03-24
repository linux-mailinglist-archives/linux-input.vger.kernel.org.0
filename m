Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249536C8379
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 18:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCXRlE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 13:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbjCXRlD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 13:41:03 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCDFC64C
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 10:41:02 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so5774399pjp.1
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679679662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Um8E04m6do3ZLKtDMOOsBN02Xc704gcd6rC24t6NjMs=;
        b=dTCq/WtoKTU5Lt1tVS/uPgOULrtgU6/CMdkaFrgPGLY7+mYO9rAnDevAJNN/kzL3gt
         CEWQqYrBV6ApopGk0GXB4T620DCumZu85YSmENy+KG7W70+Y15MJwWNiq7wxvc6LfzRV
         UI0F+E6E27/moecWkjdpPcRi1YwoWDs0Y7MeUsQ/pc6oyveTgRwO98p3M17eHscsAgsi
         ukFZHEQrj+fPsR6po2Icm4W83g1HNO7pSV3Lu0GJSCZ8sxsyygeS26G9HCADbovcC/A1
         VHZtWv03lqr9mpe3Y5g2WcxEV+BDUjdQRRbd+iKwGiTS1KYyrKfUA2F8A3aA0HG8npTG
         02SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679679662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um8E04m6do3ZLKtDMOOsBN02Xc704gcd6rC24t6NjMs=;
        b=Im/L8u1xwuIsMP7atsM6/Xw623ZzWpNyxB6qZrr6l8kzxhAwrzstZAsTaDOfaxZoRJ
         ODll7OGomvLy3scH7C0MeOttcDzgjgAC8PBMdVuP6/ScDC3Zi+ZrKyeWo6gjBbxMZ+rZ
         8FJnRtipdZYNu80iNAo3HrjzrJ6BmnAcLRSV8nBt32f9RilX1sX5UcV9DayI9pkcKCOJ
         I5DEP5GF5JsZfDdIyaj1NUYBHMyzbbVFhlLvJxH5CnXG+LqIhD1R0UxE6kCj8jlSnT/7
         OFHNWdW/WFCx7gOAP5DkLIW6+WqiLI6aHTK+Hp2KFOGHWGSrE2w5p8WOZS4XlVKQueUL
         t6Uw==
X-Gm-Message-State: AAQBX9e2h4E/2k64Gn0PRR4Qhjv9nLpzBT+Op9nLFZhImIiI2/HvEyaM
        mT/fVB80dEvZ1WAx01Lf93Tw5BxzC78=
X-Google-Smtp-Source: AKy350aKET5cNqcRlEPgIToujkGcQR4m0rJrLihvpfaYuj+eWGrvestXOmi/1it28D9cHPmsHU079w==
X-Received: by 2002:a05:6a20:cf54:b0:de:c8eb:5e1d with SMTP id hz20-20020a056a20cf5400b000dec8eb5e1dmr605500pzb.24.1679679661723;
        Fri, 24 Mar 2023 10:41:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:918f:8a48:d5d2:526d])
        by smtp.gmail.com with ESMTPSA id d13-20020aa78e4d000000b00622e01989cbsm14598967pfr.176.2023.03.24.10.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 10:41:01 -0700 (PDT)
Date:   Fri, 24 Mar 2023 10:40:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Lyude Paul <lyude@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Subject: Re: [PATCH v2 1/2] Input: xpad - Treat Qanba controllers as Xbox360
 controllers
Message-ID: <ZB3gqrUv+v0DK6hA@google.com>
References: <20230324040446.3487725-1-vi@endrift.com>
 <20230324040446.3487725-2-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324040446.3487725-2-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 23, 2023 at 09:04:45PM -0700, Vicki Pfau wrote:
> From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
> 
> They act that way in PC mode.
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry
