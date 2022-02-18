Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEA14BBDAC
	for <lists+linux-input@lfdr.de>; Fri, 18 Feb 2022 17:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238015AbiBRQkb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Feb 2022 11:40:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbiBRQka (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Feb 2022 11:40:30 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6822B2C41
        for <linux-input@vger.kernel.org>; Fri, 18 Feb 2022 08:40:13 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id o9so5146438ljq.4
        for <linux-input@vger.kernel.org>; Fri, 18 Feb 2022 08:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=e+WQSRpZ+RoF/PnfDeJAnvpZWyptj7rmrJpfzePkP6E=;
        b=UGG9G7+bXNqkuwZHjWxhaUpX9nTqxQZYp1XIL1/19iKM6hiEa/Q1lfxoEqHjgQSI94
         FteJUr2kHUTySaFBB/kZL92BWdBkrmkbGxZfgHcX6MBbPQb2ei/G31w5qWUHqmtluZmi
         tLpAAlOxBV2lBmTsUaJtx5a8OGpUcqpO8agR2C2TQHWo3Z6wikVpwVBgLPmqmk6rXXsd
         lmdG+nD+mbBuARO5uog41/Ti9KCKMReuz5qQ0ONF27S4pOfXF4oyHIYYk/in+X93hBJr
         fgHvseVE8rRobWR5EyIghcr4pMGF54is7mS2bCAuotAXV++/vHMqi3JoZ8Bh7lMss5Da
         okDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=e+WQSRpZ+RoF/PnfDeJAnvpZWyptj7rmrJpfzePkP6E=;
        b=HKrzXcBaYr7/8VAlq+YNKWI+B3hoYLxWJg/onNpdCA4xE85SAfZbJJFGwGojqkKWIz
         9SFRb+uE0SkzM0jGs2ZmX42c6oaPYyibz/rkA/6GjHdleOk71wW/1SyNgFvHEB0XDKSy
         +kJNa+TUZkZfmkM2NbJ0EWl58xfR3ihnvjtWBIT4f308UAjfdONOwApgWtYFi4FSLOJ6
         +LkTnW6pe/X8XdZqNcHIpyhNyAxKFyaimkZXrw8+QtcPwHSWJ8fOuK786bKtZV18J264
         xY+onj00hZ0Do012mIHbRn5cdxUedAjL6z/E8+h/lHTnnz+BM+8I/UljqsGjrQIqL9pz
         Szhw==
X-Gm-Message-State: AOAM5314LvdR3wceTKT4MtdFZLZN0pr9B4vQhyXs+vNFvUIDDFeRU6cs
        b7rJXthUIsR2qucYD8cWVCQ/dvswVisq3CX6c3c=
X-Google-Smtp-Source: ABdhPJwZ/w8fN0LGSHE1TGhUdj8qsJ5j/JtYr0wPtpT6n3uKbolq/ua2Znie+1UW/IRKLABYLRtBj8awwd/byjbI5GE=
X-Received: by 2002:a05:651c:908:b0:244:4ab9:d5ed with SMTP id
 e8-20020a05651c090800b002444ab9d5edmr6078384ljq.400.1645202411929; Fri, 18
 Feb 2022 08:40:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8e2d:0:0:0:0:0 with HTTP; Fri, 18 Feb 2022 08:40:11
 -0800 (PST)
Reply-To: imf.kristalinageorgieva@yahoo.com
From:   IMF - Kristalina Georgieva <elizabethjohnson184@gmail.com>
Date:   Fri, 18 Feb 2022 16:40:11 +0000
Message-ID: <CAFDOM0bwQBTWHTJ3vokeK=pyZZXqp=rF702p8HvECHWOmp=USg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:229 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [elizabethjohnson184[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [elizabethjohnson184[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

VsOhxb5lbsO9IHZsYXN0bsOtayBlLW1haWx1IC8gcMWZw61qZW1jZSBmb25kdSwNCg0KUG9zbGFs
IGpzZW0gdsOhbSB0ZW50byBkb3BpcyBwxZllZCBtxJtzw61jZW0sIGFsZSBuZXNsecWhZWwganNl
bSBvZCB2w6FzLCBhbm8NCm5lanNlbSBzaSBqaXN0w70sIGplc3RsaSBqc2kgdG8gZG9zdGFsLCBB
IHByb3RvIG9wYWt1amk6IFDFmWVkZXbFocOtbSBqc2VtDQpQYW7DrSBLcmlzdGFsaW5hIEdlb3Jn
aWV2YSwgZ2VuZXLDoWxuw60gxZllZGl0ZWxrYSBhIHByZXppZGVudGthIHNwb2xlxI1ub3N0aQ0K
TWV6aW7DoXJvZG7DrSBtxJtub3bDvSBmb25kIC4NCg0KVmUgc2t1dGXEjW5vc3RpIGpzbWUgemtv
bnRyb2xvdmFsaSB2xaFlY2hueSBwxZlla8Ohxb5reSBhIHByb2Jsw6lteSwga3RlcsOpDQp2w6Fz
IG9ia2xvcHVqw60NCm5lZG9rb27EjWVuw6EgdHJhbnNha2NlIGEgdmHFoWUgbmVzY2hvcG5vc3Qg
cMWZZXZvZCBkb2Ryxb5ldA0KcG9wbGF0a3kgw7rEjXRvdmFuw6kgcHJvdGkgdsOhbSwgcMWZZWRj
aG96w60gbW/Fvm5vc3RpIHDFmWV2b2R1IG5hbGV6bmV0ZSBuYQ0KbmHFoWljaCB3ZWJvdsO9Y2gg
c3Ryw6Fua8OhY2gNCnBybyB2YcWhZSBwb3R2cnplbsOtIDM4IMKwIDUz4oCyNTYg4oCzIE4gNzcg
wrAgMiDigLIzOSDigLMgWg0KDQpNeSwgcMWZZWRzdGF2ZW5zdHZvLCBTdsSbdG92w6EgYmFua2Eg
YSBNZXppbsOhcm9kbsOtIG3Em25vdsO9IGZvbmQNCihNTUYpIFdhc2hpbmd0b24sIERDIHZlIHNw
b2plbsOtIHMgbWluaXN0ZXJzdHZlbSBmaW5hbmPDrSBVU0ENCmEgbsSba3RlcsOpIGRhbMWhw60g
cmVsZXZhbnRuw60gdnnFoWV0xZlvdmFjw60gYWdlbnR1cnkgemRlIHZlIFNwb2plbsO9Y2gNCnN0
w6F0ZWNoIGFtZXJpY2vDvWNoDQpBbWVyaWthLiBvYmplZG5hbGEgbmHFoWUgamVkbm90a2EgcHJv
IHDFmWV2b2QgZXh0ZXJuw61jaCBwbGF0ZWIsIFVuaXRlZCBCYW5rIG9mDQpBZnJpY2EgTG9tZSBU
b2dvLCBhYnljaG9tIHbDoW0gdnlkYWxpIGthcnR1IFZJU0EsIGtkZSBidWRldGUgbcOtdCAxLDUN
Cm1pbGlvbnUgZG9sYXLFrw0KYnVkb3UgbmHEjXRlbnkgcHJvIHBvemTEm2rFocOtIHbDvWLEm3Ig
eiB2YcWhZWhvIGZvbmR1Lg0KDQpWIHByxa9ixJtodSBuYcWhZWhvIHZ5xaFldMWZb3bDoW7DrSBq
c21lIGtlIHN2w6ltdSB6ZMSbxaFlbsOtIHpqaXN0aWxpLCDFvmUgdmHFoWUNCnBsYXRiYSBieWxh
IHpieXRlxI1uxJsgemRyxb5vdsOhbmEgemtvcnVtcG92YW7DvW1pIGJhbmtvdm7DrW1pIMO6xZll
ZG7DrWt5LA0Ka3RlxZnDrSBzZSBvIHRvIHNuYcW+w60NCnDFmWVzbcSbcnVqdGUgc3bDqSBwcm9z
dMWZZWRreSBuYSBzdsOpIHNvdWtyb23DqSDDusSNdHkuDQoNCkEgZG5lcyB2w6FzIGluZm9ybXVq
ZW1lLCDFvmUgdsOhxaEgZm9uZCBieWwgcMWZaXBzw6FuIG5hIGthcnR1IFZJU0Egb2QNCkJhbmNv
IFVCQSBhIGplIHRha8OpIHDFmWlwcmF2ZW4gayBkb2TDoW7DrSwgbnluw60ga29udGFrdHVqdGUg
xZllZGl0ZWxlIHNwb2xlxI1ub3N0aQ0KQmFuY28gVUJBLCBwYW4gQ2hyaXMgd2lsbGlhbSBFLW1h
aWw6ICh1YmFiYW5rZ2dyb3VwLnRnQHlhaG9vLmNvbSkNCg0KWmHFoWxldGUgcHJvc8OtbSBuw6Fz
bGVkdWrDrWPDrSBpbmZvcm1hY2UgcHJvIGRvcnXEjWVuw60gdmHFoWVobyBha3JlZGl0b3ZhbsOp
aG8gdsOtemENCkFUTSBrYXJ0b3UgbmEgdmHFoWkgYWRyZXN1Lg0KDQpWYcWhZSBjZWzDqSBqbcOp
bm8gPT09PT09PT09PT09PT09PT09PT09PT09PT0NClZhxaFlIHplbcSbIHDFr3ZvZHUgPT09PT09
PT09PT09PT09PT09DQpBZHJlc2EgdmHFoWVobyBkb21vdmEgPT09PT09PT09PT09PT09PT09PT09
DQpWw6HFoSB2xJtrID09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KVmHFoWUgcG9obGF2w60g
PT09PT09PT09PT09PT09PT09PT09PT09DQpWYcWhZSB0ZWxlZm9ubsOtIMSNw61zbG8gPT09PT09
PT09PT09PT09PT09PT0NCg0KUyBwb3pkcmF2ZW0sDQpwYW7DrSBLcmlzdGFsaW5hIEdlb3JnaWV2
YQ0K
