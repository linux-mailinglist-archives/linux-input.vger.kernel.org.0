Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3875705FC
	for <lists+linux-input@lfdr.de>; Mon, 11 Jul 2022 16:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbiGKOm1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jul 2022 10:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiGKOmH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jul 2022 10:42:07 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36B46D2EF
        for <linux-input@vger.kernel.org>; Mon, 11 Jul 2022 07:42:05 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id y2so5065408ior.12
        for <linux-input@vger.kernel.org>; Mon, 11 Jul 2022 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A6cQ25aRnwcaLYA+THouzTgrCw6BaJucMoUnEGF0gbs=;
        b=S2KwqRIx7+KCCa4W4VwX2KnXxEegwxZMR1+YmdkB84FWfA8DBXBCW/4gHLNCZ6ZuhE
         T3zC/6bjvMfENk1OrzRuiRm2FNKBGL1JZ+BoFuHF2dU2qx7JkQbrrLhysIfAzQyur2nc
         wgvHhrf4QllwOEm2IdGYsveH2q0HzyBjsdynFt6glIi12Qr1z47LLvrDn5O4NzuMTPln
         /rpVXi9aVO59C/KkyQpdX+KTyKEBj01GpQdnwfoy1FRHknerDHKRsXEkpesy+xKTZkmG
         MJv4kKmehDGc6JdkZQdtRBmh+rYxQo5yDjV4Doz9Zotw8hVrnSOPsSs5yGDrkSug5g5a
         bwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A6cQ25aRnwcaLYA+THouzTgrCw6BaJucMoUnEGF0gbs=;
        b=oHdXy2mS3Ln8K9fbk8kgO3gIVUeL6Fo1yLQXczeWjoDYSIrDhAR/l5oNmhsZ5JcMru
         AsMI3LWtHhYluvEjG7Tjeh37V6fLegkUHL6pA30muI8idcRX8Ad0+FPLBXTdSA9Of3+O
         Cb8DiRhlkYllaPDn/wgI9x6+cVjOune982C6lcbNbbOjvDQua2AfWZ+Z/2Ssakyy+0pm
         SZWVF1/cUoxJilS0QNcrqZA3jPTBy5m1Ibz52YGT+/vIdUYQhhtOh5g+L+3aeCQNzXrm
         pKNGURQOH2B/O6l9wdze6OdEOq/ErVtigqz8Eya/1YulrHq8aVtxfeo0x7CMghKhUKBs
         oXYw==
X-Gm-Message-State: AJIora+U/QcMrkzu6WLrhGaZrTe7U+FXBIHfvIH1ajhkW8E4Qhkh5/JJ
        u5Jx0pCA/v2Zyzoe0U6k2MMbICY8RkQBpQnwPRVdOQ==
X-Google-Smtp-Source: AGRyM1tbft5+RC0NfpSCIgWK7XJp29V8Jnopf/Mw/Cg3zxE0noFwh/RcnJnd1MAtBQNibxoVhRzzXVPvTpx1Ch5ZI5M=
X-Received: by 2002:a05:6638:24c7:b0:33c:d725:6f42 with SMTP id
 y7-20020a05663824c700b0033cd7256f42mr10956723jat.114.1657550524854; Mon, 11
 Jul 2022 07:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220710175043.192901-1-jose.exposito89@gmail.com> <20220710175043.192901-2-jose.exposito89@gmail.com>
In-Reply-To: <20220710175043.192901-2-jose.exposito89@gmail.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 11 Jul 2022 07:41:53 -0700
Message-ID: <CAGS_qxpotikOpURnnx5mVtormgEbkn7xp5Hi5FScnODa5P+_fg@mail.gmail.com>
Subject: Re: [PATCH 1/7] HID: uclogic: KUnit best practices and naming conventions
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, spbnick@gmail.com,
        j.witteveen@gmail.com, stefanberzl@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 10, 2022 at 10:51 AM Jos=C3=A9 Exp=C3=B3sito
<jose.exposito89@gmail.com> wrote:
>
> The KUnit documentation [1] suggests allowing build tests as a module.
>
> In addition, it is recommended [2] to use snake case names for
> kunit_suite and test cases.

Test parameters don't fall under "test cases", though I see how that
can be construed as such.
I don't think anyone has stated any preference to standardize the naming th=
ere.

We currently have parameterized tests using spaces and punctuation, e.g.
ok 7 - binfmt_elf
    # Subtest: ext4_inode_test
    1..1
        # Subtest: inode_test_xtimestamp_decoding
        ok 1 - 1901-12-13 Lower bound of 32bit < 0 timestamp, no extra bits
        ok 2 - 1969-12-31 Upper bound of 32bit < 0 timestamp, no extra bits
...
    ok 1 - mctp_test_fragment
        # Subtest: mctp_test_rx_input
        ok 1 - {1,a,8,0}
        ok 2 - {1,a,9,0}
        ok 3 - {2,a,8,0}

So I think the old names were more conventional.

>
> Change the Kconfig entry from bool to tristate and stick to the naming
> conventions to avoid style issues with future tests.
>
> Link: https://docs.kernel.org/dev-tools/kunit/style.html#test-kconfig-ent=
ries  [1]
> Link: https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html  =
[2]
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>

Everything else (renaming the suite and switching to tristate) sounds
good to me though.

Acked-by: Daniel Latypov <dlatypov@google.com>
