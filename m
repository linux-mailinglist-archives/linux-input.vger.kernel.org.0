Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B62951D523
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 12:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359422AbiEFKHs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 06:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245092AbiEFKHs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 06:07:48 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B80E5A2D5
        for <linux-input@vger.kernel.org>; Fri,  6 May 2022 03:04:05 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id D30C0240012;
        Fri,  6 May 2022 10:04:02 +0000 (UTC)
Message-ID: <42bb6003dfa668b8829b8810bf97be2ba636857c.camel@hadess.net>
Subject: Re: [PATCH 1/1] HID: apple: Properly handle function keys on
 Keychron keyboards
From:   Bastien Nocera <hadess@hadess.net>
To:     Bryan Cain <bryancain3@gmail.com>, linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Date:   Fri, 06 May 2022 12:04:02 +0200
In-Reply-To: <20220505191221.36172-2-bryancain3@gmail.com>
References: <20220505191221.36172-1-bryancain3@gmail.com>
         <20220505191221.36172-2-bryancain3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVGh1LCAyMDIyLTA1LTA1IGF0IDEzOjEyIC0wNjAwLCBCcnlhbiBDYWluIHdyb3RlOgo+ICvC
oMKgwqDCoMKgwqDCoGlmIChmbm1vZGUgPT0gMykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZWFsX2ZubW9kZSA9IChhc2MtPnF1aXJrcyAmIEFQUExFX0lTX0tFWUNIUk9OKSA/
IDIgOgo+IDE7Cj4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmVhbF9mbm1vZGUgPSBmbm1vZGU7Cj4gK8KgwqDCoMKgwqDCoMKgfQoKV291
bGRuJ3QgaXQgYmUgd29ydGggYWRkaW5nIGFuIGVudW0gZm9yIHRob3NlIHZhbHVlcz8gKHdoZW4g
dGhlCmNvbmZpZ3VyYXRpb24gd2FzIGFkZGVkIHdvdWxkIGhhdmUgYmVlbiBhIGJldHRlciB0aW1l
LCBidXQgdGhlIHNlY29uZApiZXN0IHRpbWUgdG8gZG8gaXQgd291bGQgYmUgbm93IDspCg==

