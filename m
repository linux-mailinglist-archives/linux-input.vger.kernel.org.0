Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADF37A8A59
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 19:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbjITRMo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 13:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbjITRMd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 13:12:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B611A1;
        Wed, 20 Sep 2023 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695229927; x=1726765927;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=yJLKex7CFGPlGXRJYX8tqcOeyjbPV+pLuNqCcRVCqpQ=;
  b=DgMPrXmnswcAtJzZaZ6tDLzxP8EYSicUEFSGLJnd1xePFEqk7JdSAohv
   5aEE7Y5Ofx6okBvXiWvf71Mew9mhT12/HeVgYyYMzmiOGosx2or+toZQe
   O7qIxlkvz3n9C8PBme1ZUMhlCBLAeXKbdUyUQedQxglBGHG/av1jrInhl
   4MY3LaV60tShtz+IgUl40QB38PcsghzYAfBx9VCT7zKpK9EM9HPkm9JGd
   ZIPIJFch2D1FCJxQq1ssFGECpk3DJyJySARmaLHE0CZ8xrYe+vZQqdF+g
   v2rmc6Fr0KxVXO0XJQfYaOZ4njpj5VUmuHXaugR1EnlhSWue9lYmwS6Tx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411231908"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="411231908"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 10:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077533497"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="1077533497"
Received: from spandruv-desk1.amr.corp.intel.com ([10.212.142.24])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 10:10:35 -0700
Message-ID: <4c30d15ddce151e72944535f5f23a1bf1ce329e5.camel@linux.intel.com>
Subject: Re: [PATCH v2 7/9] iio: hid-sensor-als: Add light chromaticity
 support
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, jic23@kernel.org, lars@metafoo.de,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org
Date:   Wed, 20 Sep 2023 10:10:35 -0700
In-Reply-To: <20230919081054.2050714-8-Basavaraj.Natikar@amd.com>
References: <20230919081054.2050714-1-Basavaraj.Natikar@amd.com>
         <20230919081054.2050714-8-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDEzOjQwICswNTMwLCBCYXNhdmFyYWogTmF0aWthciB3cm90
ZToKPiBJbiBtb3N0IGNhc2VzLCBhbWJpZW50IGNvbG9yIHNlbnNvcnMgYWxzbyBzdXBwb3J0IHRo
ZSB4IGFuZCB5IGxpZ2h0Cj4gY29sb3JzLCB3aGljaCByZXByZXNlbnQgdGhlIGNvb3JkaW5hdGVz
IG9uIHRoZSBDSUUgMTkzMSBjaHJvbWF0aWNpdHkKPiBkaWFncmFtLiBUaHVzLCBhZGQgbGlnaHQg
Y2hyb21hdGljaXR5IHggYW5kIHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFzYXZhcmFqIE5hdGlr
YXIgPEJhc2F2YXJhai5OYXRpa2FyQGFtZC5jb20+CkFja2VkLWJ5OiBTcmluaXZhcyBQYW5kcnV2
YWRhPHNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPgoKPiAtLS0KPiDCoGRyaXZl
cnMvaWlvL2xpZ2h0L2hpZC1zZW5zb3ItYWxzLmMgfCA2Mwo+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+IMKgaW5jbHVkZS9saW51eC9oaWQtc2Vuc29yLWlkcy5owqDCoMKgwqAgfMKg
IDMgKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lpby9saWdodC9oaWQtc2Vuc29yLWFscy5jCj4gYi9kcml2ZXJzL2lpby9s
aWdodC9oaWQtc2Vuc29yLWFscy5jCj4gaW5kZXggMTZhM2YxOTQxYzI3Li5jOWQxMTRmZjA4MGEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvaGlkLXNlbnNvci1hbHMuYwo+ICsrKyBi
L2RyaXZlcnMvaWlvL2xpZ2h0L2hpZC1zZW5zb3ItYWxzLmMKPiBAQCAtMTcsNiArMTcsOCBAQCBl
bnVtIHsKPiDCoMKgwqDCoMKgwqDCoMKgQ0hBTk5FTF9TQ0FOX0lOREVYX0lOVEVOU0lUWSwKPiDC
oMKgwqDCoMKgwqDCoMKgQ0hBTk5FTF9TQ0FOX0lOREVYX0lMTFVNLAo+IMKgwqDCoMKgwqDCoMKg
wqBDSEFOTkVMX1NDQU5fSU5ERVhfQ09MT1JfVEVNUCwKPiArwqDCoMKgwqDCoMKgwqBDSEFOTkVM
X1NDQU5fSU5ERVhfQ0hST01BVElDSVRZX1gsCj4gK8KgwqDCoMKgwqDCoMKgQ0hBTk5FTF9TQ0FO
X0lOREVYX0NIUk9NQVRJQ0lUWV9ZLAo+IMKgwqDCoMKgwqDCoMKgwqBDSEFOTkVMX1NDQU5fSU5E
RVhfTUFYCj4gwqB9Owo+IMKgCj4gQEAgLTc2LDYgKzc4LDMwIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaWlvX2NoYW5fc3BlYyBhbHNfY2hhbm5lbHNbXSA9Cj4gewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgQklUKElJT19DSEFOX0lORk9fSFlTVEVSRVNJU19SRUxBVElWRSksCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuc2Nhbl9pbmRleCA9IENIQU5ORUxfU0NB
Tl9JTkRFWF9DT0xPUl9URU1QLAo+IMKgwqDCoMKgwqDCoMKgwqB9LAo+ICvCoMKgwqDCoMKgwqDC
oHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnR5cGUgPSBJSU9fQ0hST01BVElD
SVRZLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubW9kaWZpZWQgPSAxLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuY2hhbm5lbDIgPSBJSU9fTU9EX1gsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5pbmZvX21hc2tfc2VwYXJhdGUgPSBCSVQoSUlP
X0NIQU5fSU5GT19SQVcpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuaW5mb19t
YXNrX3NoYXJlZF9ieV90eXBlID0gQklUKElJT19DSEFOX0lORk9fT0ZGU0VUKQo+IHwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQklUKElJT19DSEFOX0lORk9fU0NBTEUpIHwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQklUKElJT19DSEFOX0lORk9fU0FNUF9GUkVR
KSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVChJSU9fQ0hBTl9JTkZPX0hZ
U1RFUkVTSVMpIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQklUKElJT19DSEFO
X0lORk9fSFlTVEVSRVNJU19SRUxBVElWRSksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC5zY2FuX2luZGV4ID0gQ0hBTk5FTF9TQ0FOX0lOREVYX0NIUk9NQVRJQ0lUWV9YLAo+ICvC
oMKgwqDCoMKgwqDCoH0sCj4gK8KgwqDCoMKgwqDCoMKgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAudHlwZSA9IElJT19DSFJPTUFUSUNJVFksCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC5tb2RpZmllZCA9IDEsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC5jaGFubmVsMiA9IElJT19NT0RfWSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLmluZm9fbWFza19zZXBhcmF0ZSA9IEJJVChJSU9fQ0hBTl9JTkZPX1JBVyksCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5pbmZvX21hc2tfc2hhcmVkX2J5X3R5cGUgPSBCSVQo
SUlPX0NIQU5fSU5GT19PRkZTRVQpCj4gfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBCSVQoSUlPX0NIQU5fSU5GT19TQ0FMRSkgfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBCSVQoSUlPX0NIQU5fSU5GT19TQU1QX0ZSRVEpIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgQklUKElJT19DSEFOX0lORk9fSFlTVEVSRVNJUykgfAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoSUlPX0NIQU5fSU5GT19IWVNURVJFU0lTX1JFTEFUSVZF
KSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnNjYW5faW5kZXggPSBDSEFOTkVM
X1NDQU5fSU5ERVhfQ0hST01BVElDSVRZX1ksCj4gK8KgwqDCoMKgwqDCoMKgfSwKPiDCoMKgwqDC
oMKgwqDCoMKgSUlPX0NIQU5fU09GVF9USU1FU1RBTVAoQ0hBTk5FTF9TQ0FOX0lOREVYX1RJTUVT
VEFNUCkKPiDCoH07Cj4gwqAKPiBAQCAtMTE5LDYgKzE0NSwxNiBAQCBzdGF0aWMgaW50IGFsc19y
ZWFkX3JhdyhzdHJ1Y3QgaWlvX2Rldgo+ICppbmRpb19kZXYsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWluID0gYWxzX3N0YXRlLT5hbHNbY2hhbi0K
PiA+c2Nhbl9pbmRleF0ubG9naWNhbF9taW5pbXVtOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFkZHJlc3MgPQo+IEhJRF9VU0FHRV9TRU5TT1JfTElH
SFRfQ09MT1JfVEVNUEVSQVRVUkU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNh
c2XCoCBDSEFOTkVMX1NDQU5fSU5ERVhfQ0hST01BVElDSVRZX1g6Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXBvcnRfaWQgPSBhbHNfc3RhdGUtPmFs
c1tjaGFuLQo+ID5zY2FuX2luZGV4XS5yZXBvcnRfaWQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtaW4gPSBhbHNfc3RhdGUtPmFsc1tjaGFuLQo+ID5z
Y2FuX2luZGV4XS5sb2dpY2FsX21pbmltdW07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBhZGRyZXNzID0KPiBISURfVVNBR0VfU0VOU09SX0xJR0hUX0NI
Uk9NQVRJQ0lUWV9YOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2XCoCBDSEFO
TkVMX1NDQU5fSU5ERVhfQ0hST01BVElDSVRZX1k6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXBvcnRfaWQgPSBhbHNfc3RhdGUtPmFsc1tjaGFuLQo+
ID5zY2FuX2luZGV4XS5yZXBvcnRfaWQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBtaW4gPSBhbHNfc3RhdGUtPmFsc1tjaGFuLQo+ID5zY2FuX2luZGV4
XS5sb2dpY2FsX21pbmltdW07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBhZGRyZXNzID0KPiBISURfVVNBR0VfU0VOU09SX0xJR0hUX0NIUk9NQVRJQ0lU
WV9ZOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJl
YWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlcG9ydF9pZCA9IC0xOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+
IEBAIC0yNDMsNiArMjc5LDE0IEBAIHN0YXRpYyBpbnQgYWxzX2NhcHR1cmVfc2FtcGxlKHN0cnVj
dAo+IGhpZF9zZW5zb3JfaHViX2RldmljZSAqaHNkZXYsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBhbHNfc3RhdGUtPnNjYW4uaWxsdW1bQ0hBTk5FTF9TQ0FOX0lOREVYX0NPTE9S
X1RFTVBdCj4gPSBzYW1wbGVfZGF0YTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldCA9IDA7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDC
oMKgwqDCoMKgwqBjYXNlIEhJRF9VU0FHRV9TRU5TT1JfTElHSFRfQ0hST01BVElDSVRZX1g6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFsc19zdGF0ZS0KPiA+c2Nhbi5pbGx1bVtD
SEFOTkVMX1NDQU5fSU5ERVhfQ0hST01BVElDSVRZX1hdID0gc2FtcGxlX2RhdGE7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgSElEX1VTQUdFX1NFTlNPUl9M
SUdIVF9DSFJPTUFUSUNJVFlfWToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWxz
X3N0YXRlLQo+ID5zY2FuLmlsbHVtW0NIQU5ORUxfU0NBTl9JTkRFWF9DSFJPTUFUSUNJVFlfWV0g
PSBzYW1wbGVfZGF0YTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gMDsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDC
oGNhc2UgSElEX1VTQUdFX1NFTlNPUl9USU1FX1RJTUVTVEFNUDoKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGFsc19zdGF0ZS0+dGltZXN0YW1wID0KPiBoaWRfc2Vuc29yX2NvbnZl
cnRfdGltZXN0YW1wKCZhbHNfc3RhdGUtPmNvbW1vbl9hdHRyaWJ1dGVzLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgCj4gKihzNjQgKilyYXdfZGF0YSk7Cj4gQEAgLTI5MSw2ICszMzUsMjUgQEAgc3Rh
dGljIGludCBhbHNfcGFyc2VfcmVwb3J0KHN0cnVjdAo+IHBsYXRmb3JtX2RldmljZSAqcGRldiwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0LT5hbHNbQ0hBTk5FTF9TQ0FOX0lO
REVYX0NPTE9SX1RFTVBdLmluZGV4LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c3QtPmFsc1tDSEFOTkVMX1NDQU5fSU5ERVhfQ09MT1JfVEVNUF0ucmVwb3J0X2lkKTsKPiDCoAo+
ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCAyOyBpKyspIHsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaW50IG5leHRfc2Nhbl9pbmRleCA9Cj4gQ0hBTk5FTF9TQ0FOX0lO
REVYX0NIUk9NQVRJQ0lUWV9YICsgaTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldCA9IHNlbnNvcl9odWJfaW5wdXRfZ2V0X2F0dHJpYnV0ZV9pbmZvKGhzZGV2LAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoEhJRF9JTlBVVF9SRVBPUlQsIHVzYWdlX2lkLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEhJRF9VU0FHRV9TRU5TT1Jf
TElHSFRfQ0hST01BVElDSVRZX1gKPiArIGksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJnN0LT5hbHNbbmV4dF9zY2FuX2lu
ZGV4XSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgPCAwKQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsK
PiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFsc19hZGp1c3RfY2hhbm5lbF9i
aXRfbWFzayhjaGFubmVscywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQ0hBTk5FTF9TQ0FOX0lO
REVYX0NIUk9NQVRJQ0kKPiBUWV9YICsgaSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3QtCj4g
PmFsc1tuZXh0X3NjYW5faW5kZXhdLnNpemUpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZGV2X2RiZygmcGRldi0+ZGV2LCAiYWxzICV4OiV4XG4iLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3QtPmFsc1tuZXh0X3NjYW5faW5k
ZXhdLmluZGV4LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgc3QtPmFsc1tuZXh0X3NjYW5faW5kZXhdLnJlcG9ydF9pZCk7Cj4gK8KgwqDCoMKgwqDCoMKg
fQo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgc3QtPnNjYWxlX3ByZWNpc2lvbiA9IGhpZF9zZW5zb3Jf
Zm9ybWF0X3NjYWxlKHVzYWdlX2lkLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmc3QtCj4gPmFsc1tDSEFOTkVMX1NDQU5f
SU5ERVhfSU5URU5TSVRZXSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJnN0LT5zY2FsZV9wcmVfZGVjbWwsICZzdC0KPiA+
c2NhbGVfcG9zdF9kZWNtbCk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaGlkLXNlbnNv
ci1pZHMuaCBiL2luY2x1ZGUvbGludXgvaGlkLQo+IHNlbnNvci1pZHMuaAo+IGluZGV4IDhhZjRm
YjNlMDI1NC4uNjczMGVlOTAwZWUxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvaGlkLXNl
bnNvci1pZHMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaGlkLXNlbnNvci1pZHMuaAo+IEBAIC0y
Miw2ICsyMiw5IEBACj4gwqAjZGVmaW5lCj4gSElEX1VTQUdFX1NFTlNPUl9EQVRBX0xJR0hUwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDIw
MDRkMAo+IMKgI2RlZmluZQo+IEhJRF9VU0FHRV9TRU5TT1JfTElHSFRfSUxMVU3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDIwMDRkMQo+IMKg
I2RlZmluZQo+IEhJRF9VU0FHRV9TRU5TT1JfTElHSFRfQ09MT1JfVEVNUEVSQVRVUkXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDIwMDRkMgo+ICsjZGVmaW5lCj4gSElEX1VTQUdFX1NF
TlNPUl9MSUdIVF9DSFJPTUFUSUNJVFnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgMHgyMDA0ZDMKPiArI2RlZmluZQo+IEhJRF9VU0FHRV9TRU5TT1JfTElHSFRfQ0hST01B
VElDSVRZX1jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDIwMDRkNAo+ICsj
ZGVmaW5lCj4gSElEX1VTQUdFX1NFTlNPUl9MSUdIVF9DSFJPTUFUSUNJVFlfWcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MjAwNGQ1Cj4gwqAKPiDCoC8qIFBST1ggKDIwMDAx
MSkgKi8KPiDCoCNkZWZpbmUgSElEX1VTQUdFX1NFTlNPUl9QUk9YwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiAweDIw
MDAxMQoK

