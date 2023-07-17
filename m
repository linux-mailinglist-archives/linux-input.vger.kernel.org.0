Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C6E756878
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 17:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjGQP63 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 11:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjGQP63 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 11:58:29 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6991AD8;
        Mon, 17 Jul 2023 08:58:28 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bb119be881so30510765ad.3;
        Mon, 17 Jul 2023 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689609508; x=1692201508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+bOfqSwedf3Zn21Be8Z3oCoR/wNU1/sBKf0jcoXXRO8=;
        b=npF7FHYGUavYivdyLxELB5DvoBm34UpJxi7V7EPkkKrLHuxMnpR3Ky9ouyZIIKoNwb
         N/42Tmbh4A0n50DvCIPYptfsBkBgqtn147YYZfqdZTEJ7aoAKlpSK9GNcKGzGZh5Z+oL
         C/Ek8AiFMAWPulaCNDXAOR4xPpyPUv+hf141zQppuhDqDLtQ5QMnVr/sf5dnrOtk0KM1
         i0dO+oleTvFmDCo4yH/Tkf0ZHuCsI1nCztJ6Aki0LCVOATkqW+R9n9u9tYFHoc6ky5/A
         dR0gykuSQ5kuWie4/87nKnRoQQ5vZcANQkGzxtSa4yc9sIxNPbM/jPHe/PtpJwJmK0ff
         +Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609508; x=1692201508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bOfqSwedf3Zn21Be8Z3oCoR/wNU1/sBKf0jcoXXRO8=;
        b=QU7PfcVLuROGIt3JDh3RLSqaIXw2dbYrCiXT3UGRAkjV9B+jw5L26QqwdxJfgEAmai
         HP2pD4xSKIQglkSB6tnLhiKGabUfqPHb3EUPKxZ5jKwPXIkxROsquRvRb691ArdhHtif
         UMxbJZTCweRMP/aRYxRJl/magBfw8/Nk7NS7nH7sWgW3oDB28228cRl866D9hBE8sxNm
         qUBDnt9OyQsdg60E3bDM5/SVT43jbgRBfdg0WtK5YafxB9NKHEIBdbDtdx5LMBW2NhnY
         n+dAcX7b5kzfZjgMf5Wq41XP8XJBd9KbfRJPajy7qboHEhH6s8Pf/WvYdMKUxsImhw3d
         /STQ==
X-Gm-Message-State: ABy/qLYiCHP10ZwYX/TFJP3gWfBo/yJ11kNuk/3lppFEyos1ZRdNgAGZ
        Wje/BYxCJcPQ3+AjKm6EAOtOTE3uQYM=
X-Google-Smtp-Source: APBJJlHZ3Gbjkve88NhR9/q2qTAMAAOVov6PqsLxqyP2icKlqu4fu5MWS3NmCHRlEMhSjCM6bDkfoA==
X-Received: by 2002:a17:902:dac3:b0:1b8:a56b:989d with SMTP id q3-20020a170902dac300b001b8a56b989dmr14909641plx.6.1689609507652;
        Mon, 17 Jul 2023 08:58:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1e30:2510:1b57:a9cd])
        by smtp.gmail.com with ESMTPSA id i5-20020a1709026ac500b0019ee045a2b3sm35195plt.308.2023.07.17.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:58:27 -0700 (PDT)
Date:   Mon, 17 Jul 2023 08:58:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Message-ID: <ZLVlIPHdmEGdG5D1@google.com>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Biju,

On Mon, Jul 17, 2023 at 02:17:55PM +0100, Biju Das wrote:
> The exc3000_id.driver_data could store a pointer to the info,
> like for ACPI/DT-based matching, making I2C, ACPI and DT-based
> matching more similar.
> 
> After that, we can simplify the probe() by replacing device_get_
> match_data() and i2c_match_id() by i2c_get_match_data() as we have
> similar I2C, ACPI and DT-based matching table.

Have you considered enhancing device_get_match_data() to allow for
bus-specific "get_match_data" implementations? This way the drivers
would simply call device_get_match_data() and not care if they are I2C,
SPI, or something else...

Thanks.

-- 
Dmitry
